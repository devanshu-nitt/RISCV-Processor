module riscv_top #(
	parameter WIDTH    = 8,
    	parameter PC       = 8,
    	parameter INST     = 32,
    	parameter REG_ADDR = 5,
    	parameter ALUCTRL  = 4,
    	parameter ALUOP    = 2,
    	parameter OPCODE   = 7,
    	parameter FUNC3    = 3,
    	parameter FUNC7    = 7,
    	parameter FWD      = 2,
    	parameter MEM_ADDR = 8
)(
    	input wire clk,
    	input wire reset
);

    	// ??? IF/ID boundary wires ???????????????????????????????????????????????
    	wire [INST-1:0]    if_instruction;
    	wire [PC-1:0]      if_pc;

    	// ??? ID/EX boundary wires ???????????????????????????????????????????????
    	wire [WIDTH-1:0]   id_rdata1, id_rdata2, id_imm;
    	wire [ALUCTRL-1:0] id_alu_ctrl;
    	wire               id_reg_write, id_mem_read, id_mem_write;
    	wire               id_mem_to_reg, id_alu_src, id_branch;
    	wire [REG_ADDR-1:0] id_rd, id_rs1, id_rs2;
    	wire [PC-1:0]      id_pc;

    	// ??? EX/MEM boundary wires ??????????????????????????????????????????????
   	 wire [WIDTH-1:0]   ex_alu_result, ex_src2_raw;
    	wire               ex_zero;
    	wire [PC-1:0]      ex_pc_branch;
    	wire               ex_mem_read, ex_mem_write, ex_mem_to_reg;
    	wire               ex_reg_write, ex_branch;
    	wire [REG_ADDR-1:0] ex_rd;

    	// ??? MEM/WB boundary wires ??????????????????????????????????????????????
    	wire [WIDTH-1:0]   mem_read_data;
    	wire [MEM_ADDR-1:0] mem_alu_result;
    	wire [REG_ADDR-1:0] mem_rd;
    	wire               mem_mem_to_reg, mem_reg_write;

    	// ??? Branch/PC control ??????????????????????????????????????????????????
    	wire               pc_src;
    	wire [PC-1:0]      pc_branch;

    	// ??? WB ?????????????????????????????????????????????????????????????????
    	wire [WIDTH-1:0]   wb_write_data;

    	// ??? Forwarding ?????????????????????????????????????????????????????????
    	wire [FWD-1:0]     fwd_a, fwd_b;

    	// ????????????????????????????????????????????????????????????????????????
    	// Stage instantiations
    	// ????????????????????????????????????????????????????????????????????????
	
    	if_stage #(
      	 	.PC(PC), .INST(INST)
    	) IF (
        	.clk          (clk),
        	.reset        (reset),
        	.pc_src       (pc_src),       // input  ? fixed from inout
        	.pc_jump      (pc_branch),
        	.instruction_out (if_instruction),
        	.pc_out       (if_pc)
    	);

    	id_stage #(
        	.INST(INST), .WIDTH(WIDTH), .ADDR(REG_ADDR),
        	.ALUCTRL(ALUCTRL), .OPCODE(OPCODE),
        	.FUNC3(FUNC3), .FUNC7(FUNC7),
        	.ALUOP(ALUOP), .PC(PC)
   	 ) ID (
        	.clk           (clk),
        	.reset         (reset),
        	.pc_in         (if_pc),
        	.instruction   (if_instruction),
        	.write_data    (wb_write_data),
        	.rd_wb         (mem_rd),
        	.reg_write_wb  (mem_reg_write),
        	// decoded + registered outputs
        	.read_data1_out(id_rdata1),
        	.read_data2_out(id_rdata2),
        	.imm_out       (id_imm),
        	.alu_ctrl_out  (id_alu_ctrl),
        	.reg_write_out (id_reg_write),
        	.mem_read_out  (id_mem_read),
        	.mem_write_out (id_mem_write),
        	.mem_to_reg_out(id_mem_to_reg),
        	.alu_src_out   (id_alu_src),
        	.branch_out    (id_branch),
        	.rd_out        (id_rd),
        	.pc_out        (id_pc),
        	.rs1_out       (id_rs1),      // new port ? needed by fwd unit
        	.rs2_out       (id_rs2)       // new port
    	);

    	ex_stage #(
       		.WIDTH(WIDTH), .ALUCTRL(ALUCTRL), .FWD(FWD),
        	.PC(PC), .REG_ADDR(REG_ADDR)
    	) EX (
        	.clk           (clk),
        	.reset         (reset),
        	.op1           (id_rdata1),
        	.op2           (id_rdata2),
        	.imm           (id_imm),
        	.alu_src       (id_alu_src),
        	.alu_ctrl      (id_alu_ctrl),
        	.pc_in         (id_pc),
        	// pass-through control
        	.mem_read_in   (id_mem_read),
       		.mem_write_in  (id_mem_write),
       		.mem_to_reg_in (id_mem_to_reg),
       		.reg_write_in  (id_reg_write),
        	.branch_in     (id_branch),
        	.rd_in         (id_rd),
        	// forwarding
        	.fwd_a         (fwd_a),
        	.fwd_b         (fwd_b),
        	.ex_mem_result (ex_alu_result),   // EX/MEM ALU result for forwarding
        	.mem_wb_result (wb_write_data),   // WB value for forwarding
        	// outputs
        	.alu_result_out(ex_alu_result),
        	.zero_out      (ex_zero),
        	.pc_out        (ex_pc_branch),
        	.src2_raw_out  (ex_src2_raw),
        	.mem_read_out  (ex_mem_read),
        	.mem_write_out (ex_mem_write),
        	.mem_to_reg_out(ex_mem_to_reg),
        	.reg_write_out (ex_reg_write),
        	.branch_out    (ex_branch),
        	.rd_out        (ex_rd)
    	);

    	mem_stage #(
        	.ADDR(MEM_ADDR), .REG_ADDR(REG_ADDR),
        	.WIDTH(WIDTH), .PC(PC)
    	) MEM (
        	.clk           (clk),
        	.reset         (reset),
        	.mem_read_in   (ex_mem_read),
        	.alu_result_in (ex_alu_result),
        	.mem_write_in  (ex_mem_write),
        	.write_data_in (ex_src2_raw),
        	.rd_in         (ex_rd),
        	.pc_branch_in  (ex_pc_branch),
        	.mem_to_reg_in (ex_mem_to_reg),
        	.reg_write_in  (ex_reg_write),
        	.branch_in     (ex_branch),
        	.zero_in       (ex_zero),
        	// outputs
        	.read_data_out (mem_read_data),
        	.alu_result_out(mem_alu_result),
        	.rd_out        (mem_rd),
        	.mem_to_reg_out(mem_mem_to_reg),
        	.reg_write_out (mem_reg_write),
        	.pc_src        (pc_src),
        	.pc_branch_out (pc_branch)
    	);

    	wb_stage #(
        	.WIDTH(WIDTH)
    	) WB (
        	.read_data  (mem_read_data),
        	.alu_result (mem_alu_result[WIDTH-1:0]),   // slice to WIDTH bits
        	.mem_to_reg (mem_mem_to_reg),
        	.write_data (wb_write_data)
    	);

    	forwarding_unit #(
        	.REG_ADDR(REG_ADDR), .FWD(FWD)
    	) FWD_UNIT (
        	.rs1_ex        (id_rs1),
        	.rs2_ex        (id_rs2),
        	.rd_mem        (ex_rd),
        	.reg_write_mem (ex_reg_write),
        	.rd_wb         (mem_rd),
        	.reg_write_wb  (mem_reg_write),
        	.fwd_a         (fwd_a),
        	.fwd_b         (fwd_b)
    	);

endmodule
