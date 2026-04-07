module alu_control #(	parameter ALUOP = 2,
			parameter FUNC3 = 3,
			parameter FUNC7 = 7,
			parameter ALUCTRL = 4)(
	
	input wire	[ALUOP-1:0]	alu_op,
	input wire	[FUNC3-1:0]	func3,
	input wire	[FUNC7-1:0]	func7,
	output reg	[ALUCTRL-1:0]	alu_ctrl
);
	parameter ADD = 4'b0010;
	parameter SUB = 4'b0110;
	parameter AND = 4'b0000;
	parameter OR  = 4'b0001;
	parameter XOR = 4'b0011;
	
	always @(*) begin
		case(alu_op) 
			2'b00:	alu_ctrl = ADD; //load/store.
			2'b01:	alu_ctrl = SUB;	//branch
			2'b10:	begin // R type instruction.
				case({func7, func3}) 
					10'b0000000000:	alu_ctrl = ADD;
					10'b0000000000:	alu_ctrl = SUB;
					10'b0000000000:	alu_ctrl = AND;
					10'b0000000000:	alu_ctrl = OR;
					10'b0000000000:	alu_ctrl = XOR;
					default: alu_ctrl = ADD;
				endcase
			end
			default: alu_ctrl = ADD;
		endcase
	end
endmodule