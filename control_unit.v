module control_unit #(	parameter OPCODE = 7,
			parameter ALUOP = 2)(
	
	input wire	[OPCODE-1:0] 	opcode,

	output reg	reg_write, // for writing in reg used in WB stage.
	output reg	mem_read,  // enables reading from memory used in MEM stage
	output reg	mem_write,
	output reg	mem_to_reg,// controls what writes in reg : 1 :mem data; 0: ALU_result
	output reg	alu_src, // selects second ALU operannd; 1:immediate ; 0: register
	output reg	branch,
	output reg	[ALUOP-1:0] alu_op // tells alu control type of operation category
);
	always @(*) begin
		case(opcode)
		7'b0110011: begin // R-type
			reg_write = 1;
			mem_read  = 0;
			mem_write = 0;
			mem_to_reg= 0;
			alu_src   = 0;
			branch    = 0;
			alu_op    = 2'b10;
			end

		7'b0000011: begin // LOAD
			reg_write = 1;
			mem_read  = 1;
			mem_write = 0;
			mem_to_reg= 1;
			alu_src   = 1;
			branch    = 0;
			alu_op    = 2'b00;
			end

		7'b0100011: begin // STORE
			reg_write = 0;
			mem_read  = 0;
			mem_write = 1;
			mem_to_reg= 0;
			alu_src   = 1;
			branch    = 0;
			alu_op    = 2'b00;
			end

		7'b1100011: begin // BEQ
			reg_write = 0;
			mem_read  = 0;
			mem_write = 0;
			mem_to_reg= 0;
			alu_src   = 0;
			branch    = 1;
			alu_op    = 2'b01;
			end

		default: begin
			reg_write = 0;
			mem_read  = 0;
			mem_write = 0;
			mem_to_reg= 0;
			alu_src   = 0;
			branch    = 0;
			alu_op    = 2'b00;
			end
		endcase
	end
endmodule