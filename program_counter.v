module program_counter #(parameter PC=8)(
	input wire	clk,
	input wire	reset,
	input wire	[PC-1:0]	pc_in,
	input wire			stall,
	output reg	[PC-1:0]	pc_out
);
	always @(posedge clk) begin	
		if(reset)	pc_out <= 0;
		else if(!stall)	pc_out <= pc_in;
	end
endmodule
