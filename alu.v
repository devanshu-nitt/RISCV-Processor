module alu #(	parameter N = 8,
		parameter CTRL = 4)(
	
	
	input wire	[N-1:0] a,
	input wire	[N-1:0] b,
	input wire	[CTRL-1:0] alu_ctrl,
	output reg	[N-1:0] result,
	output wire	zero
);
	parameter	ADD = 4'b0010;
	parameter	SUB = 4'b0110;
	parameter	AND = 4'b0000;
	parameter	OR = 4'b0001;
	parameter	XOR = 4'b0011;

	always @(*) begin
		case (alu_ctrl)
			ADD:	result = a+b;
			SUB:	result = a-b;
			AND:	result = a&b;
			OR:	result = a|b;
			XOR:	result = a^b;
			default	result = 0;
		endcase
	end
	assign zero = (result ==0);
endmodule
