module imm_gen #(	parameter INST,
			parameter IMM,
			parameter OPCODE)(
	
	input wire	[INST-1:0]	instruction,
	output reg	[IMM-1:0]	imm_out
);
	wire	[OPCODE-1:0]	opcode = instruction [OPCODE-1: 0];
	
	always @(*) begin
		case(opcode)
			7'b0000011: imm_out = instruction[31:20];// LOAD (I-type)
			7'b0100011: imm_out = instruction[31:25];// STORE (S-type)
			7'b1100011: imm_out = instruction[31:25];// BRANCH (SB-type)
			default: imm_out = 8'b0;
		endcase
	end
endmodule