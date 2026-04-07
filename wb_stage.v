module	wb_stage #(	parameter WIDTH = 8
			)(
	
	input wire	[WIDTH-1:0]	read_data,
	input wire	[WIDTH-1:0]	alu_result,
	input wire			mem_to_reg,

	output wire	[WIDTH-1:0]	write_data
);
	
	assign	write_data = (mem_to_reg)? read_data : alu_result;

endmodule