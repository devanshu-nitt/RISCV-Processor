// =============================================================================
// RISC-V 8-bit Pipelined Processor ? Comprehensive Testbench
// =============================================================================
// Covers:
//   Section 1 : Setup ? pre-load data memory and establish base register values
//   Section 2 : R-type instruction battery (ADD, SUB, AND, OR, XOR)
//   Section 3 : EX/MEM forwarding  ? back-to-back RAW hazard (fwd = 2'b10)
//   Section 4 : MEM/WB forwarding  ? one-NOP-gap RAW hazard (fwd = 2'b01)
//   Section 5 : Double forwarding  ? both operands forwarded simultaneously
//   Section 6 : Load-use hazard    ? LD followed by mandatory NOP then ADD
//   Section 7 : STORE + load-back  ? write to memory, reload and verify
//   Section 8 : BEQ taken          ? branch fires, 3-cycle delay slot filled
//   Section 9 : BEQ not taken      ? branch does not fire, sequential flow OK
//
// Hierarchy assumptions (adjust to your top module instance names):
//   DUT.IF.pc_current       ? current PC wire inside if_stage
//   DUT.IF.inst_mm.inst[]   ? instruction memory array
//   DUT.ID.RF.registers[]   ? register file array
//   DUT.MEM.DM.mem[]        ? data memory array
//   DUT.FWD_UNIT.fwd_a/b    ? forwarding control outputs
//   DUT.EX.alu_result_out   ? registered ALU result out of EX stage
//   DUT.EX.zero_out         ? registered zero flag out of EX stage
//   DUT.MEM.pc_src          ? branch-taken signal (combinational)
//
// Data memory pre-loaded values (set in initial block below):
//   mem[0] = 0    mem[1] = 5    mem[2] = 3
//   mem[3] = 10   mem[4] = 7    mem[5] = 0  (target for store test)
//
// Register assignments after setup:
//   x1  = 5     x2  = 3     x3  = 8  (add)    x4  = 2  (sub)
//   x5  = 1     x6  = 7     x7  = 6  (xor)    x8  = 8  (fwd producer)
//   x9  = 13    x10 = 8     x11 = 11            x12 = 8
//   x13 = 16    x14 = 10    x15 = 15            x16 = 8  (store verify)
//   x17 = 8  (branch target) x18 = 8  (no-branch target)
// =============================================================================

`timescale 1ns/1ps

module riscv_tb;

// ??? Inputs to DUT ?????????????????????????????????????????????????????????
reg clk;
reg reset;

// ??? Clock: 10 ns period ???????????????????????????????????????????????????
initial clk = 0;
always  #5 clk = ~clk;

// ??? DUT instantiation ?????????????????????????????????????????????????????
riscv_top DUT (
    .clk   (clk),
    .reset (reset)
);

// ??? Global cycle counter ??????????????????????????????????????????????????
integer cycle_count;
initial cycle_count = 0;
always @(posedge clk) cycle_count = cycle_count + 1;

// ??? Pass / fail counters ??????????????????????????????????????????????????
integer pass_count;
integer fail_count;
initial begin pass_count = 0; fail_count = 0; end

// =============================================================================
// TASKS
// =============================================================================

// Wait N rising clock edges
task wait_cycles;
    input integer n;
    integer i;
    begin
        for (i = 0; i < n; i = i + 1) @(posedge clk);
    end
endtask

// Check a general-purpose register against an expected 8-bit value.
// regnum   : register index (0?31)
// expected : expected 8-bit value
// tag      : short string label printed in the pass/fail message
task check_reg;
    input [4:0]  regnum;
    input [7:0]  expected;
    input [79:0] tag;  // up to 10 ASCII chars packed
    reg   [7:0]  actual;
    begin
        actual = DUT.ID.RF.registers[regnum];
        if (actual !== expected) begin
            $display("  FAIL  [%-10s]  x%0d = 8'd%0d (0x%02h)  expected 8'd%0d (0x%02h)  @ cycle %0d",
                     tag, regnum, actual, actual, expected, expected, cycle_count);
            fail_count = fail_count + 1;
        end else begin
            $display("  pass  [%-10s]  x%0d = 8'd%0d", tag, regnum, actual);
            pass_count = pass_count + 1;
        end
    end
endtask

// Check a data memory location
task check_mem;
    input [7:0]  addr;
    input [7:0]  expected;
    input [79:0] tag;
    reg   [7:0]  actual;
    begin
        actual = DUT.MEM.DM.mem[addr];
        if (actual !== expected) begin
            $display("  FAIL  [%-10s]  mem[%0d] = 8'd%0d  expected 8'd%0d  @ cycle %0d",
                     tag, addr, actual, expected, cycle_count);
            fail_count = fail_count + 1;
        end else begin
            $display("  pass  [%-10s]  mem[%0d] = 8'd%0d", tag, addr, actual);
            pass_count = pass_count + 1;
        end
    end
endtask

// =============================================================================
// INSTRUCTION MEMORY PROGRAM
// =============================================================================
// Encoding reference:
//   R-type : funct7[6:0] | rs2[4:0] | rs1[4:0] | funct3[2:0] | rd[4:0]  | opcode[6:0]
//   I-type : imm[11:0]             | rs1[4:0] | funct3[2:0] | rd[4:0]  | opcode[6:0]
//   S-type : imm[11:5]   | rs2[4:0]| rs1[4:0] | funct3[2:0] | imm[4:0] | opcode[6:0]
//   SB-type: {imm[11:5]} | rs2[4:0]| rs1[4:0] | funct3[2:0] | {imm[4:0]}| opcode[6:0]
//            (this processor uses simplified SB imm = {inst[31:25],inst[11:7]})
//
// Opcodes: R=0110011  LD=0000011  SD=0100011  BEQ=1100011
// funct3 : ADD/SUB/LD/SD=000  AND=111  OR=110  XOR=100
// funct7 : ADD/others=0000000  SUB=0100000
// =============================================================================

initial begin

    // ?? SECTION 1: SETUP (PC 0?5) ?????????????????????????????????????????
    // Goal: load known values into x1 and x2 from data memory.
    // Signals to watch: after PC=1 reaches WB, x1 must equal mem[1]=5.
    //                   after PC=2 reaches WB, x2 must equal mem[2]=3.
    // Pipeline timing: instruction at PC=N has result in RF after N+5 cycles.
    //
    // PC 0: NOP ? pipeline warm-up
    DUT.IF.inst_mm.inst[0]  = 32'b00000000000000000000000000000000;

    // PC 1: ld x1, 1(x0)  ?  x1 = mem[0 + 1] = 5
    //        imm=000000000001 rs1=00000 f3=000 rd=00001 op=0000011
    DUT.IF.inst_mm.inst[1]  = 32'b000000000001_00000_000_00001_0000011;

    // PC 2: ld x2, 2(x0)  ?  x2 = mem[0 + 2] = 3
    //        imm=000000000010 rs1=00000 f3=000 rd=00010 op=0000011
    DUT.IF.inst_mm.inst[2]  = 32'b000000000010_00000_000_00010_0000011;

    // PC 3?5: NOPs ? mandatory load-use stall (no hazard unit present)
    // WHY: x1 is not yet in RF when the next non-NOP instruction fetches it.
    //      Without a hardware stall unit, insert at least 2 NOPs after a LD
    //      before using the loaded register.
    DUT.IF.inst_mm.inst[3]  = 32'b0;
    DUT.IF.inst_mm.inst[4]  = 32'b0;
    DUT.IF.inst_mm.inst[5]  = 32'b0;

    // ?? SECTION 2: R-TYPE BATTERY (PC 6?25) ??????????????????????????????
    // Goal: verify all five ALU operations.  3 NOPs between each instruction
    // ensure the previous result is in RF before the next instruction issues
    // ? no forwarding needed here, verifying baseline operation.
    //
    // Monitor per instruction:
    //   - DUT.ID.id_alu_ctrl : should match operation
    //   - DUT.EX.alu_result_out after posedge when EX stage processes it
    //   - DUT.ID.RF.registers[rd] after WB

    // PC 6: add x3, x1, x2  ?  x3 = 5 + 3 = 8
    //        f7=0000000 rs2=00010 rs1=00001 f3=000 rd=00011 op=0110011
    DUT.IF.inst_mm.inst[6]  = 32'b0000000_00010_00001_000_00011_0110011;
    DUT.IF.inst_mm.inst[7]  = 32'b0; // NOP
    DUT.IF.inst_mm.inst[8]  = 32'b0; // NOP
    DUT.IF.inst_mm.inst[9]  = 32'b0; // NOP

    // PC 10: sub x4, x1, x2  ?  x4 = 5 - 3 = 2
    //         f7=0100000 rs2=00010 rs1=00001 f3=000 rd=00100 op=0110011
    DUT.IF.inst_mm.inst[10] = 32'b0100000_00010_00001_000_00100_0110011;
    DUT.IF.inst_mm.inst[11] = 32'b0;
    DUT.IF.inst_mm.inst[12] = 32'b0;
    DUT.IF.inst_mm.inst[13] = 32'b0;

    // PC 14: and x5, x1, x2  ?  x5 = 5 & 3 = 1  (0b00000101 & 0b00000011)
    //         f7=0000000 rs2=00010 rs1=00001 f3=111 rd=00101 op=0110011
    DUT.IF.inst_mm.inst[14] = 32'b0000000_00010_00001_111_00101_0110011;
    DUT.IF.inst_mm.inst[15] = 32'b0;
    DUT.IF.inst_mm.inst[16] = 32'b0;
    DUT.IF.inst_mm.inst[17] = 32'b0;

    // PC 18: or x6, x1, x2  ?  x6 = 5 | 3 = 7  (0b00000101 | 0b00000011)
    //         f7=0000000 rs2=00010 rs1=00001 f3=110 rd=00110 op=0110011
    DUT.IF.inst_mm.inst[18] = 32'b0000000_00010_00001_110_00110_0110011;
    DUT.IF.inst_mm.inst[19] = 32'b0;
    DUT.IF.inst_mm.inst[20] = 32'b0;
    DUT.IF.inst_mm.inst[21] = 32'b0;

    // PC 22: xor x7, x1, x2  ?  x7 = 5 ^ 3 = 6  (0b00000101 ^ 0b00000011)
    //         f7=0000000 rs2=00010 rs1=00001 f3=100 rd=00111 op=0110011
    DUT.IF.inst_mm.inst[22] = 32'b0000000_00010_00001_100_00111_0110011;
    DUT.IF.inst_mm.inst[23] = 32'b0;
    DUT.IF.inst_mm.inst[24] = 32'b0;
    DUT.IF.inst_mm.inst[25] = 32'b0;

    // ?? SECTION 3: EX/MEM FORWARDING ? fwd_a = 2'b10 (PC 26?30) ??????????
    // Goal: producer result (x8) is consumed IMMEDIATELY (no NOP between).
    //       Forwarding unit must detect rd_mem == rs1_ex and set fwd_a=2'b10.
    //
    // Signals to watch AT THE CYCLE when PC=27 is in EX stage:
    //   DUT.FWD_UNIT.rs1_ex   = 5'd8   (x8)
    //   DUT.FWD_UNIT.rd_mem   = 5'd8   (x8 is in EX/MEM)
    //   DUT.FWD_UNIT.fwd_a    = 2'b10  ? MUST be this
    //   DUT.EX.src1           = 8'd8   (forwarded value)
    //   DUT.EX.alu_result_out = 8'd13  (8 + 5)

    // PC 26: add x8, x1, x2  ?  x8 = 8   (producer)
    //         f7=0000000 rs2=00010 rs1=00001 f3=000 rd=01000 op=0110011
    DUT.IF.inst_mm.inst[26] = 32'b0000000_00010_00001_000_01000_0110011;

    // PC 27: add x9, x8, x1  ?  x9 = x8 + x1  ? fwd_a=2'b10 fires here
    //         f7=0000000 rs2=00001 rs1=01000 f3=000 rd=01001 op=0110011
    //         NOTE: rs1=x8, rs2=x1  ?  expected result = 8 + 5 = 13
    DUT.IF.inst_mm.inst[27] = 32'b0000000_00001_01000_000_01001_0110011;
    DUT.IF.inst_mm.inst[28] = 32'b0;
    DUT.IF.inst_mm.inst[29] = 32'b0;
    DUT.IF.inst_mm.inst[30] = 32'b0;

    // ?? SECTION 4: MEM/WB FORWARDING ? fwd_a = 2'b01 (PC 31?36) ??????????
    // Goal: ONE NOP between producer and consumer.  By the time consumer
    //       reaches EX, producer is in MEM/WB stage ? fwd_a = 2'b01.
    //
    // Signals to watch AT THE CYCLE when PC=33 is in EX stage:
    //   DUT.FWD_UNIT.rs1_ex   = 5'd10   (x10)
    //   DUT.FWD_UNIT.rd_wb    = 5'd10   (x10 is in MEM/WB)
    //   DUT.FWD_UNIT.fwd_a    = 2'b01   ? MUST be this
    //   DUT.EX.alu_result_out = 8'd11   (8 + 3)

    // PC 31: add x10, x1, x2  ?  x10 = 8  (producer)
    //         f7=0000000 rs2=00010 rs1=00001 f3=000 rd=01010 op=0110011
    DUT.IF.inst_mm.inst[31] = 32'b0000000_00010_00001_000_01010_0110011;

    // PC 32: NOP  ? x10 now in EX/MEM, not yet MEM/WB ? fwd would be 2'b10
    //               this NOP shifts x10 into MEM/WB before consumer hits EX
    DUT.IF.inst_mm.inst[32] = 32'b0;

    // PC 33: add x11, x10, x2  ?  x11 = x10 + x2 ? fwd_a=2'b01 fires here
    //         f7=0000000 rs2=00010 rs1=01010 f3=000 rd=01011 op=0110011
    //         expected = 8 + 3 = 11
    DUT.IF.inst_mm.inst[33] = 32'b0000000_00010_01010_000_01011_0110011;
    DUT.IF.inst_mm.inst[34] = 32'b0;
    DUT.IF.inst_mm.inst[35] = 32'b0;
    DUT.IF.inst_mm.inst[36] = 32'b0;

    // ?? SECTION 5: DOUBLE FORWARDING ? fwd_a=2'b10 AND fwd_b=2'b10 (PC 37?41)
    // Goal: BOTH rs1 and rs2 of consumer are the same register that was just
    //       written by the immediately preceding instruction.
    //       Forwarding unit must assert BOTH fwd_a=2'b10 and fwd_b=2'b10.
    //
    // Signals to watch AT THE CYCLE when PC=38 is in EX stage:
    //   DUT.FWD_UNIT.fwd_a    = 2'b10
    //   DUT.FWD_UNIT.fwd_b    = 2'b10
    //   DUT.EX.alu_result_out = 8'd16  (8 + 8, wraps OK at 8-bit: 0x10 = 16)

    // PC 37: add x12, x1, x2  ?  x12 = 8  (producer)
    //         f7=0000000 rs2=00010 rs1=00001 f3=000 rd=01100 op=0110011
    DUT.IF.inst_mm.inst[37] = 32'b0000000_00010_00001_000_01100_0110011;

    // PC 38: add x13, x12, x12 ?  x13 = x12 + x12 = 16  ? BOTH operands fwd
    //         f7=0000000 rs2=01100 rs1=01100 f3=000 rd=01101 op=0110011
    DUT.IF.inst_mm.inst[38] = 32'b0000000_01100_01100_000_01101_0110011;
    DUT.IF.inst_mm.inst[39] = 32'b0;
    DUT.IF.inst_mm.inst[40] = 32'b0;
    DUT.IF.inst_mm.inst[41] = 32'b0;

    // ?? SECTION 6: LOAD-USE HAZARD (PC 42?47) ?????????????????????????????
    // Goal: verify that inserting ONE NOP after a LD (simulating the stall that
    //       a hazard detection unit would insert automatically) allows the
    //       loaded value to reach MEM/WB before the consumer enters EX,
    //       at which point fwd_a=2'b01 forwards it correctly.
    //
    // WHY THIS IS SPECIAL compared to Section 4:
    //   In Sec 4, the producer wrote its result from the ALU (available at end
    //   of EX).  Here, the loaded value is only available at the end of the MEM
    //   stage ? one cycle later.  Therefore even with ONE NOP, fwd_a=2'b01
    //   provides the right data only if MEM/WB has already latched the load result.
    //
    // Signals to watch AT THE CYCLE when PC=44 is in EX stage:
    //   DUT.MEM.DM.read_data   = 8'd10   (x14 value in MEM/WB read_data path)
    //   DUT.FWD_UNIT.rd_wb     = 5'd14   (x14)
    //   DUT.FWD_UNIT.fwd_a     = 2'b01
    //   DUT.EX.alu_result_out  = 8'd15   (10 + 5)

    // PC 42: ld x14, 3(x0)  ?  x14 = mem[3] = 10
    //         imm=000000000011 rs1=00000 f3=000 rd=01110 op=0000011
    DUT.IF.inst_mm.inst[42] = 32'b000000000011_00000_000_01110_0000011;

    // PC 43: NOP  ? CRITICAL load-use stall NOP
    DUT.IF.inst_mm.inst[43] = 32'b0;

    // PC 44: add x15, x14, x1  ?  x15 = 10 + 5 = 15
    //         f7=0000000 rs2=00001 rs1=01110 f3=000 rd=01111 op=0110011
    DUT.IF.inst_mm.inst[44] = 32'b0000000_00001_01110_000_01111_0110011;
    DUT.IF.inst_mm.inst[45] = 32'b0;
    DUT.IF.inst_mm.inst[46] = 32'b0;
    DUT.IF.inst_mm.inst[47] = 32'b0;

    // ?? SECTION 7: STORE + LOAD-BACK VERIFICATION (PC 48?55) ?????????????
    // Goal: write a computed value to data memory, then reload it into a
    //       different register and verify end-to-end memory write/read.
    //
    // sd encoding: imm[11:5]=inst[31:25], imm[4:0]=inst[11:7]
    //   imm=5 ? inst[31:25]=0000000, inst[11:7]=00101
    //
    // Signals to watch when PC=48 is in MEM stage:
    //   DUT.MEM.DM.mem[5]  must change from 0 to 8 on posedge
    //   DUT.MEM.mem_write  = 1
    //   DUT.EX.alu_result_out (used as address)  = 5

    // PC 48: sd x3, 5(x0)  ?  mem[5] = x3 = 8
    //         imm[11:5]=0000000 rs2=00011 rs1=00000 f3=000 imm[4:0]=00101 op=0100011
    DUT.IF.inst_mm.inst[48] = 32'b0000000_00011_00000_000_00101_0100011;
    DUT.IF.inst_mm.inst[49] = 32'b0;
    DUT.IF.inst_mm.inst[50] = 32'b0;
    DUT.IF.inst_mm.inst[51] = 32'b0;

    // PC 52: ld x16, 5(x0)  ?  x16 = mem[5] ? should equal 8 after store
    //         imm=000000000101 rs1=00000 f3=000 rd=10000 op=0000011
    DUT.IF.inst_mm.inst[52] = 32'b000000000101_00000_000_10000_0000011;
    DUT.IF.inst_mm.inst[53] = 32'b0;
    DUT.IF.inst_mm.inst[54] = 32'b0;
    DUT.IF.inst_mm.inst[55] = 32'b0;

    // ?? SECTION 8: BEQ TAKEN (PC 56?63) ??????????????????????????????????
    // Goal: branch condition is TRUE (x1 == x1).  PC must jump to 56+4=60.
    //       Instructions at PC=57, 58, 59 are in the branch delay slots and
    //       are NOPs ? they must NOT alter any register state.
    //       PC=60 executes: x17 = x1 + x2 = 8.
    //       If x17 ends up 0 (from the skipped PC=57), branch did NOT work.
    //
    // Signals to watch when PC=56 enters MEM stage:
    //   DUT.EX.zero_out = 1        (SUB result 5-5=0 ? zero flag)
    //   DUT.MEM.pc_src  = 1        (branch & zero)
    //   DUT.IF.pc_current           jumps to 60 on next cycle
    //
    // Branch delay: the processor fetches 57, 58, 59 before it can redirect.
    // These slots are intentionally NOP to avoid unintended side effects.

    // PC 56: beq x1, x1, +4  ?  taken, jump to PC=56+4=60
    //   SB imm=4: inst[31:25]=0000000, inst[11:7]=00100
    //   rs2=00001(x1) rs1=00001(x1) f3=000 op=1100011
    DUT.IF.inst_mm.inst[56] = 32'b0000000_00001_00001_000_00100_1100011;

    // PC 57?59: NOPs  ? branch delay slots (pipeline still fetching these)
    // IF x17 BECOMES NON-ZERO HERE: branch did not work, pipeline not flushing
    DUT.IF.inst_mm.inst[57] = 32'b0; // NOP (delay slot 1)
    DUT.IF.inst_mm.inst[58] = 32'b0; // NOP (delay slot 2)
    DUT.IF.inst_mm.inst[59] = 32'b0; // NOP (delay slot 3)

    // PC 60: add x17, x1, x2  ?  x17 = 5 + 3 = 8  (ONLY reached if taken)
    //         f7=0000000 rs2=00010 rs1=00001 f3=000 rd=10001 op=0110011
    DUT.IF.inst_mm.inst[60] = 32'b0000000_00010_00001_000_10001_0110011;
    DUT.IF.inst_mm.inst[61] = 32'b0;
    DUT.IF.inst_mm.inst[62] = 32'b0;
    DUT.IF.inst_mm.inst[63] = 32'b0;

    // ?? SECTION 9: BEQ NOT TAKEN (PC 64?69) ??????????????????????????????
    // Goal: branch condition is FALSE (x1=5, x2=3, 5?3).
    //       pc_src must remain 0, PC continues to 65.
    //       x18 = x1 + x2 = 8 must execute normally.
    //
    // Signals to watch when PC=64 is in MEM stage:
    //   DUT.EX.zero_out = 0        (SUB 5-3=2 ? not zero)
    //   DUT.MEM.pc_src  = 0        (branch is 1 but zero is 0 ? no branch)
    //   DUT.IF.pc_current           continues to 65, 66, 67... (no jump)

    // PC 64: beq x1, x2, +4  ?  NOT taken (5 ? 3), fall through to PC=65
    //   rs2=00010(x2) rs1=00001(x1) f3=000 op=1100011
    DUT.IF.inst_mm.inst[64] = 32'b0000000_00010_00001_000_00100_1100011;

    // PC 65: add x18, x1, x2  ?  x18 = 5 + 3 = 8  (must execute)
    //         f7=0000000 rs2=00010 rs1=00001 f3=000 rd=10010 op=0110011
    DUT.IF.inst_mm.inst[65] = 32'b0000000_00010_00001_000_10010_0110011;
    DUT.IF.inst_mm.inst[66] = 32'b0;
    DUT.IF.inst_mm.inst[67] = 32'b0;
    DUT.IF.inst_mm.inst[68] = 32'b0;
    DUT.IF.inst_mm.inst[69] = 32'b0;

// ??????????????????????????????????????????????????????????????????????????
// SECTION 10: Single-slot flush ? early branch resolution in ID (PC 70?78)
// Verify exactly ONE instruction is flushed, not three.
// x20 is placed in the flush slot ? must stay 0.
// x19 is at the branch target ? must execute and equal 8.
// ??????????????????????????????????????????????????????????????????????????
DUT.IF.inst_mm.inst[70] = 32'b0; // separator NOP

// PC 71: beq x1, x1, +4  ?  taken, jump to PC 75 (x1==x1 always)
DUT.IF.inst_mm.inst[71] = 32'b0000000_00001_00001_000_00100_1100011;

// PC 72: add x20, x1, x2  ?  FLUSH SLOT ? must NOT execute (x20 stays 0)
DUT.IF.inst_mm.inst[72] = 32'b0000000_00010_00001_000_10100_0110011;

DUT.IF.inst_mm.inst[73] = 32'b0; // NOP
DUT.IF.inst_mm.inst[74] = 32'b0; // NOP

// PC 75: add x19, x1, x2  ?  x19 = 8  (branch target ? must execute)
DUT.IF.inst_mm.inst[75] = 32'b0000000_00010_00001_000_10011_0110011;

DUT.IF.inst_mm.inst[76] = 32'b0;
DUT.IF.inst_mm.inst[77] = 32'b0;
DUT.IF.inst_mm.inst[78] = 32'b0;

// ??????????????????????????????????????????????????????????????????????????
// SECTION 11: Branch comparator with EX/MEM forwarding (PC 79?87)
// Producer (x21) immediately before BEQ ? comparator must read forwarded
// value, not stale RF value (RF still holds x21=0 at this point).
// x22 is the flush slot victim ? must stay 0.
// x23 is at branch target ? must equal 8.
// ??????????????????????????????????????????????????????????????????????????

// PC 79: add x21, x1, x2  ?  x21 = 8  (comparator forwarding source)
DUT.IF.inst_mm.inst[79] = 32'b0000000_00010_00001_000_10101_0110011;

// PC 80: beq x21, x3, +4  ?  x21 forwarded from EX/MEM = 8, x3 = 8 ? taken
//         jump to PC 84
//         rs1=x21(10101), rs2=x3(00011)
DUT.IF.inst_mm.inst[80] = 32'b0000000_00011_10101_000_00100_1100011;

// PC 81: add x22, x1, x2  ?  FLUSH SLOT ? must NOT execute
DUT.IF.inst_mm.inst[81] = 32'b0000000_00010_00001_000_10110_0110011;

DUT.IF.inst_mm.inst[82] = 32'b0;
DUT.IF.inst_mm.inst[83] = 32'b0;

// PC 84: add x23, x1, x2  ?  x23 = 8  (branch target)
DUT.IF.inst_mm.inst[84] = 32'b0000000_00010_00001_000_10111_0110011;

DUT.IF.inst_mm.inst[85] = 32'b0;
DUT.IF.inst_mm.inst[86] = 32'b0;
DUT.IF.inst_mm.inst[87] = 32'b0;

// ??????????????????????????????????????????????????????????????????????????
// SECTION 12: Branch comparator with MEM/WB forwarding (PC 88?97)
// ONE NOP between producer and BEQ shifts result from EX/MEM into MEM/WB.
// Comparator must pick up fwd_mem_result (rd_wb path), not fwd_ex_result.
// x25 is flush slot victim ? must stay 0.
// x26 is branch target ? must equal 8.
// ??????????????????????????????????????????????????????????????????????????

// PC 88: add x24, x1, x2  ?  x24 = 8  (producer)
DUT.IF.inst_mm.inst[88] = 32'b0000000_00010_00001_000_11000_0110011;

// PC 89: NOP  ?  shifts x24 from EX/MEM into MEM/WB before BEQ hits ID
DUT.IF.inst_mm.inst[89] = 32'b0;

// PC 90: beq x24, x3, +4  ?  x24 from MEM/WB = 8, x3 = 8 ? taken
//         jump to PC 94
//         rs1=x24(11000), rs2=x3(00011)
DUT.IF.inst_mm.inst[90] = 32'b0000000_00011_11000_000_00100_1100011;

// PC 91: add x25, x1, x2  ?  FLUSH SLOT ? must NOT execute
DUT.IF.inst_mm.inst[91] = 32'b0000000_00010_00001_000_11001_0110011;

DUT.IF.inst_mm.inst[92] = 32'b0;
DUT.IF.inst_mm.inst[93] = 32'b0;

// PC 94: add x26, x1, x2  ?  x26 = 8  (branch target)
DUT.IF.inst_mm.inst[94] = 32'b0000000_00010_00001_000_11010_0110011;

DUT.IF.inst_mm.inst[95] = 32'b0;
DUT.IF.inst_mm.inst[96] = 32'b0;
DUT.IF.inst_mm.inst[97] = 32'b0;

// ??????????????????????????????????????????????????????????????????????????
// SECTION 13: Load-before-branch with 1 manual NOP (PC 98?108)
// LD result is unavailable in ID stage (load resolves in MEM, one stage
// after ALU results). A single NOP shifts the LD into MEM/WB before BEQ
// reaches ID, making fwd_mem_result valid for the comparator.
// x28 is flush slot victim ? must stay 0.
// x29 is branch target ? must equal 8.
// ??????????????????????????????????????????????????????????????????????????

// PC 98: ld x27, 1(x0)  ?  x27 = mem[1] = 5
DUT.IF.inst_mm.inst[98]  = 32'b000000000001_00000_000_11011_0000011;

// PC 99: NOP  ?  mandatory NOP: load-before-branch needs this extra cycle
//                without it, x27 is still in MEM when BEQ is in ID
DUT.IF.inst_mm.inst[99]  = 32'b0;

// PC 100: beq x27, x1, +4  ?  x27 from MEM/WB = 5, x1 = 5 ? taken
//          jump to PC 104
//          rs1=x27(11011), rs2=x1(00001)
DUT.IF.inst_mm.inst[100] = 32'b0000000_00001_11011_000_00100_1100011;

// PC 101: add x28, x1, x2  ?  FLUSH SLOT ? must NOT execute
DUT.IF.inst_mm.inst[101] = 32'b0000000_00010_00001_000_11100_0110011;

DUT.IF.inst_mm.inst[102] = 32'b0;
DUT.IF.inst_mm.inst[103] = 32'b0;

// PC 104: add x29, x1, x2  ?  x29 = 8  (branch target)
DUT.IF.inst_mm.inst[104] = 32'b0000000_00010_00001_000_11101_0110011;

DUT.IF.inst_mm.inst[105] = 32'b0;
DUT.IF.inst_mm.inst[106] = 32'b0;
DUT.IF.inst_mm.inst[107] = 32'b0;

// ??????????????????????????????????????????????????????????????????????????
// SECTION 14: Automatic load-use stall via HDU ? no manual NOP (PC 108?115)
// LD immediately followed by dependent ADD. The hazard detection unit
// must detect mem_read_ex && rd_ex==rs1_id and freeze PC + IF/ID for
// one cycle, inserting a bubble into ID/EX automatically.
// After the stall, forwarding unit provides fwd_a=2'b01 (MEM/WB path).
// ??????????????????????????????????????????????????????????????????????????

// PC 108: ld x30, 2(x0)  ?  x30 = mem[2] = 3
DUT.IF.inst_mm.inst[108] = 32'b000000000010_00000_000_11110_0000011;

// PC 109: add x31, x30, x1  ?  x31 = x30 + x1 = 3 + 5 = 8
//          NO NOP ? HDU must handle this automatically
//          rs1=x30(11110), rs2=x1(00001), rd=x31(11111)
DUT.IF.inst_mm.inst[109] = 32'b0000000_00001_11110_000_11111_0110011;

DUT.IF.inst_mm.inst[110] = 32'b0;
DUT.IF.inst_mm.inst[111] = 32'b0;
DUT.IF.inst_mm.inst[112] = 32'b0;
DUT.IF.inst_mm.inst[113] = 32'b0;
DUT.IF.inst_mm.inst[114] = 32'b0;

end // instruction memory init

// =============================================================================
// DATA MEMORY PRE-LOAD
// =============================================================================
// Done BEFORE reset deasserts so values are stable on first LD instruction.
initial begin
    DUT.MEM.DM.mem[0] = 8'd0;   // x0-base: address 0
    DUT.MEM.DM.mem[1] = 8'd5;   // ? x1 = 5
    DUT.MEM.DM.mem[2] = 8'd3;   // ? x2 = 3
    DUT.MEM.DM.mem[3] = 8'd10;  // ? x14 (load-use test)
    DUT.MEM.DM.mem[4] = 8'd7;   // spare (unused in this test)
    DUT.MEM.DM.mem[5] = 8'd0;   // target for STORE test (expect 8 after sd)
end

// =============================================================================
// WAVEFORM DUMP
// =============================================================================
initial begin
    $dumpfile("riscv_wave.vcd");
    $dumpvars(0, riscv_tb);
end

// =============================================================================
// CONTINUOUS SIGNAL MONITOR
// Fires whenever any of the listed signals change. Useful in waveform viewer
// to correlate signal transitions with clock edges.
// =============================================================================
// Uncomment to enable (verbose ? best used with a short targeted simulation):
// initial $monitor(
//     "T=%0t CYC=%0d | PC=%0d | INST=%08h | fwd_a=%0b fwd_b=%0b | alu=%0d zero=%0b | pc_src=%0b",
//     $time, cycle_count,
//     DUT.IF.pc_current,
//     DUT.IF.instruction_out,
//     DUT.FWD_UNIT.fwd_a, DUT.FWD_UNIT.fwd_b,
//     DUT.EX.alu_result_out, DUT.EX.zero_out,
//     DUT.MEM.pc_src
// );

// =============================================================================
// STIMULUS & AUTOMATED CHECKS
// =============================================================================
// Timing formula: instruction at PC=N issues result to RF after N+5 cycles
// from reset deassert.  Each wait_cycles() call here waits for all
// instructions in that section PLUS 2 extra cycles as margin.
// =============================================================================

initial begin
    $display("=============================================================");
    $display(" RISC-V 8-bit Pipeline Testbench");
    $display("=============================================================");

    // ?? Apply reset ????????????????????????????????????????????????????????
    reset = 1;
    wait_cycles(3);   // hold reset for 3 cycles
    reset = 0;
    $display("[%0d] Reset deasserted ? pipeline starting", cycle_count);

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 1: SETUP LOADS
    // Wait until PC=2 (ld x2) has passed through all 5 pipeline stages.
    // Earliest x2 is valid: cycle 3 (reset off) + 2 (PC) + 5 (stages) = 10
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(10);
    $display("\n??? Section 1: Setup Loads ?????????????????????????????????");
    // Manual probe list:
    //   After clock edge where PC=1 is in WB stage: DUT.ID.RF.registers[1] == 5
    //   After clock edge where PC=2 is in WB stage: DUT.ID.RF.registers[2] == 3
    check_reg(1,  8'd5,  "LD_x1     ");
    check_reg(2,  8'd3,  "LD_x2     ");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 2: R-TYPE BATTERY
    // Last instruction (xor x7) at PC=22.  Valid after cycle 3+22+5=30.
    // We're at ~cycle 13 now; wait 20 more ? cycle 33.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(20);
    $display("\n??? Section 2: R-Type Battery ??????????????????????????????");
    // Manual probe list:
    //   When PC=6  in EX: alu_ctrl_out=4'b0010 (ADD), alu_result_out=8'd8
    //   When PC=10 in EX: alu_ctrl_out=4'b0110 (SUB), alu_result_out=8'd2
    //   When PC=14 in EX: alu_ctrl_out=4'b0000 (AND), alu_result_out=8'd1
    //   When PC=18 in EX: alu_ctrl_out=4'b0001 (OR),  alu_result_out=8'd7
    //   When PC=22 in EX: alu_ctrl_out=4'b0011 (XOR), alu_result_out=8'd6
    check_reg(3,  8'd8,  "ADD_x3    ");
    check_reg(4,  8'd2,  "SUB_x4    ");
    check_reg(5,  8'd1,  "AND_x5    ");
    check_reg(6,  8'd7,  "OR_x6     ");
    check_reg(7,  8'd6,  "XOR_x7    ");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 3: EX/MEM FORWARDING
    // Consumer (PC=27) valid after cycle 3+27+5=35. Now ~cycle 33; wait 5.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(5);
    $display("\n??? Section 3: EX/MEM Forwarding (fwd_a = 2'b10) ??????????");
    // Manual probe list ? WHEN PC=27 IS IN EX STAGE:
    //   DUT.FWD_UNIT.rs1_ex        = 5'd8   (x8 is rs1 of PC=27)
    //   DUT.FWD_UNIT.rd_mem        = 5'd8   (x8 is rd of PC=26, now in EX/MEM)
    //   DUT.FWD_UNIT.reg_write_mem = 1'b1
    //   DUT.FWD_UNIT.fwd_a         = 2'b10  ? forwarding from EX/MEM
    //   DUT.FWD_UNIT.fwd_b         = 2'b00  (x1 in rs2 not hazarded)
    //   DUT.EX.alu_result_out      = 8'd13  (8 + 5, AFTER this clock edge)
    check_reg(8,  8'd8,  "FWD_prod  ");
    check_reg(9,  8'd13, "FWD_EX_MEM");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 4: MEM/WB FORWARDING
    // Consumer (PC=33) valid after cycle 3+33+5=41. Now ~cycle 38; wait 5.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(5);
    $display("\n??? Section 4: MEM/WB Forwarding (fwd_a = 2'b01) ??????????");
    // Manual probe list ? WHEN PC=33 IS IN EX STAGE:
    //   DUT.FWD_UNIT.rs1_ex        = 5'd10  (x10 is rs1 of PC=33)
    //   DUT.FWD_UNIT.rd_wb         = 5'd10  (x10 is rd of PC=31, now in MEM/WB)
    //   DUT.FWD_UNIT.reg_write_wb  = 1'b1
    //   DUT.FWD_UNIT.fwd_a         = 2'b01  ? forwarding from MEM/WB
    //   DUT.FWD_UNIT.fwd_b         = 2'b00
    //   DUT.EX.alu_result_out      = 8'd11  (8 + 3, AFTER this clock edge)
    check_reg(10, 8'd8,  "FWD_prod2 ");
    check_reg(11, 8'd11, "FWD_MEMWB ");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 5: DOUBLE FORWARDING
    // Consumer (PC=38) valid after cycle 3+38+5=46. Now ~cycle 43; wait 5.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(5);
    $display("\n??? Section 5: Double Forwarding (fwd_a=fwd_b = 2'b10) ????");
    // Manual probe list ? WHEN PC=38 IS IN EX STAGE:
    //   DUT.FWD_UNIT.rs1_ex        = 5'd12  (x12)
    //   DUT.FWD_UNIT.rs2_ex        = 5'd12  (x12 ? same register)
    //   DUT.FWD_UNIT.rd_mem        = 5'd12  (x12 in EX/MEM)
    //   DUT.FWD_UNIT.fwd_a         = 2'b10  ? BOTH must be 2'b10
    //   DUT.FWD_UNIT.fwd_b         = 2'b10  ?
    //   DUT.EX.alu_result_out      = 8'd16  (8 + 8)
    check_reg(12, 8'd8,  "DFWD_prod ");
    check_reg(13, 8'd16, "DFWD_both ");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 6: LOAD-USE HAZARD
    // Consumer (PC=44) valid after cycle 3+44+5=52. Now ~cycle 48; wait 6.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(6);
    $display("\n??? Section 6: Load-Use Hazard (NOP stall + fwd_a=2'b01) ??");
    // Manual probe list ? WHEN PC=42 IS IN MEM STAGE:
    //   DUT.MEM.mem_read          = 1'b1
    //   DUT.MEM.DM.read_data      = 8'd10  (raw read from mem[3])
    //   DUT.MEM.read_data_out     = 8'd10  (registered one cycle later)
    // WHEN PC=44 IS IN EX STAGE (one cycle after NOP at PC=43):
    //   DUT.FWD_UNIT.rd_wb        = 5'd14  (x14 in MEM/WB)
    //   DUT.FWD_UNIT.fwd_a        = 2'b01
    //   DUT.EX.alu_result_out     = 8'd15  (10 + 5)
    check_reg(14, 8'd10, "LD_USE_ld ");
    check_reg(15, 8'd15, "LD_USE_add");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 7: STORE + LOAD-BACK
    // sd at PC=48 reaches MEM stage at cycle 3+48+4=55; mem[5] written there.
    // ld x16 at PC=52 has result at cycle 3+52+5=60. Now ~cycle 54; wait 8.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(8);
    $display("\n??? Section 7: Store + Load-Back ???????????????????????????");
    // Manual probe list ? WHEN PC=48 IS IN MEM STAGE:
    //   DUT.MEM.mem_write         = 1'b1
    //   DUT.EX.alu_result_out     = 8'd5   (address: x0 + 5)
    //   DUT.MEM.DM.mem[5]         = 8'd8   (after posedge ? x3 = 8)
    // WHEN PC=52 IS IN WB STAGE:
    //   DUT.ID.RF.registers[16]   = 8'd8
    check_mem(5,  8'd8,  "SD_mem5   ");
    check_reg(16, 8'd8,  "LD_back   ");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 8: BEQ TAKEN
    // BEQ at PC=56 resolves in MEM at cycle 3+56+4=63.
    // Target PC=60, x17 written at cycle 3+60+5=68. Now ~cycle 62; wait 8.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(8);
    $display("\n??? Section 8: BEQ Taken ???????????????????????????????????");
    // Manual probe list ? WHEN PC=56 IS IN MEM STAGE:
    //   DUT.EX.zero_out           = 1'b1   (x1-x1 = 0 ? zero flag set)
    //   DUT.MEM.branch_in         = 1'b1
    //   DUT.MEM.pc_src            = 1'b1   ? branch fires (comb.)
    //   DUT.MEM.pc_branch_out     = 8'd60  (56 + 4)
    // ON NEXT CYCLE AFTER pc_src:
    //   DUT.IF.pc_current         = 8'd60  ? PC redirected
    // x17 must be 8 (from PC=60), NOT 0 (PC=57 should be NOP/skipped)
    check_reg(17, 8'd8,  "BEQ_taken ");

    // ??????????????????????????????????????????????????????????????????????
    // SECTION 9: BEQ NOT TAKEN
    // BEQ at PC=64; x18 (PC=65) valid at cycle 3+65+5=73. Now ~cycle 70.
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(8);
    $display("\n??? Section 9: BEQ Not Taken ???????????????????????????????");
    // Manual probe list ? WHEN PC=64 IS IN MEM STAGE:
    //   DUT.EX.zero_out           = 1'b0   (x1 - x2 = 5-3 = 2 ? 0)
    //   DUT.MEM.branch_in         = 1'b1   (BEQ sets branch control bit)
    //   DUT.MEM.pc_src            = 1'b0   ? branch does NOT fire
    //   DUT.IF.pc_current         = 65, 66, 67... (sequential, no jump)
    // x18 must be 8 (PC=65 executed normally)
    check_reg(18, 8'd8,  "BEQ_notakn");

// ??????????????????????????????????????????????????????????????????????????
// SECTION 10: Single-slot flush
// PC=75 (x19) valid ~12 cycles after Section 9 checks.
// ??????????????????????????????????????????????????????????????????????????
wait_cycles(12);
$display("\n??? Section 10: Single-slot flush (early branch in ID) ?????");
check_reg(20, 8'd0, "FLUSH_kill"); // x20 MUST stay 0 ? flush slot
check_reg(19, 8'd8, "FLUSH_tgt "); // x19 = 8 ? target executed

// ??????????????????????????????????????????????????????????????????????????
// SECTION 11: Comparator ? EX/MEM forward
// PC=84 (x23) valid ~10 cycles after Section 10.
// ??????????????????????????????????????????????????????????????????????????
wait_cycles(10);
$display("\n??? Section 11: Branch comparator EX/MEM forward ???????????");
check_reg(22, 8'd0, "EXFWD_kill"); // x22 flush slot ? must stay 0
check_reg(21, 8'd8, "EXFWD_prod"); // x21 producer written correctly
check_reg(23, 8'd8, "EXFWD_tgt "); // x23 target executed

// ??????????????????????????????????????????????????????????????????????????
// SECTION 12: Comparator ? MEM/WB forward
// PC=94 (x26) valid ~12 cycles after Section 11.
// ??????????????????????????????????????????????????????????????????????????
wait_cycles(12);
$display("\n??? Section 12: Branch comparator MEM/WB forward ???????????");
check_reg(25, 8'd0, "MWFWD_kill"); // x25 flush slot ? must stay 0
check_reg(24, 8'd8, "MWFWD_prod"); // x24 producer written correctly
check_reg(26, 8'd8, "MWFWD_tgt "); // x26 target executed

// ??????????????????????????????????????????????????????????????????????????
// SECTION 13: Load-before-branch
// PC=104 (x29) valid ~14 cycles after Section 12.
// ??????????????????????????????????????????????????????????????????????????
wait_cycles(14);
$display("\n??? Section 13: Load-before-branch (1 NOP + 1 flush) ???????");
check_reg(27, 8'd5, "LDB_load  "); // x27 = mem[1] = 5 loaded correctly
check_reg(28, 8'd0, "LDB_kill  "); // x28 flush slot ? must stay 0
check_reg(29, 8'd8, "LDB_tgt   "); // x29 target executed

// ??????????????????????????????????????????????????????????????????????????
// SECTION 14: Automatic HDU load-use stall
// PC=109 (x31) valid ~14 cycles after Section 13.
// ??????????????????????????????????????????????????????????????????????????
wait_cycles(14);
$display("\n??? Section 14: Auto HDU load-use stall (no NOP) ???????????");
check_reg(30, 8'd3, "HDU_load  "); // x30 = mem[2] = 3 loaded correctly
check_reg(31, 8'd8, "HDU_add   "); // x31 = 3 + 5 = 8 (stall resolved correctly)

    // ??????????????????????????????????????????????????????????????????????
    // SUMMARY
    // ??????????????????????????????????????????????????????????????????????
    wait_cycles(5);
    $display("\n=============================================================");
    $display(" RESULTS: %0d passed,  %0d failed", pass_count, fail_count);
    $display("=============================================================\n");

    if (fail_count == 0)
        $display(" ALL TESTS PASSED");
    else
        $display(" %0d TEST(S) FAILED ? see FAIL lines above", fail_count);

    #20 $finish;
end

// =============================================================================
// PER-CYCLE DISPLAY  (active ? prints each posedge for pipeline visibility)
// Shows key signals as the program advances. Redirect to a file in simulation:
//   vsim -do "run -all" > pipeline_trace.txt
// =============================================================================
always @(posedge clk) begin
    if (!reset) begin
        $display("CYC=%03d | PC=%02d | INST=%08h | fwd_a=%b fwd_b=%b | alu=%03d zero=%b | pc_src=%b",
            cycle_count,
            DUT.IF.pc_current,
            DUT.IF.instruction_out,
            DUT.FWD_UNIT.fwd_a,
            DUT.FWD_UNIT.fwd_b,
            DUT.EX.alu_result_out,
            DUT.EX.zero_out,
            DUT.MEM.pc_src
        );
    end
end

endmodule
// =============================================================================
// END OF TESTBENCH
// =============================================================================
