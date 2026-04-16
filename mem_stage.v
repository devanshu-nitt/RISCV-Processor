module mem_stage #(	parameter ADDR = 8,
			parameter REG_ADDR = 5,
			parameter WIDTH = 8,
			parameter PC = 8)(
	
	input wire	clk,
	input wire	reset,
	
	input wire			mem_read_in,
	input wire	[WIDTH-1:0]	alu_result_in,
	input wire			mem_write_in,
	input wire	[WIDTH-1:0]	write_data_in,

	input wire	[REG_ADDR-1:0]	rd_in,
	input wire	[PC-1:0]	pc_branch_in,
	input wire			mem_to_reg_in,
	input wire			reg_write_in,
	input wire			branch_in,
	input wire			zero_in,

	output reg	[WIDTH-1:0]	read_data_out,
	output reg	[WIDTH-1:0]	alu_result_out,
	output reg	[REG_ADDR-1:0]	rd_out,

	output reg			mem_to_reg_out,
	output reg			reg_write_out,
	output wire			pc_src,
	output wire	[PC-1:0]	pc_branch_out

	//output wire	[WIDTH-1:0]	alu_result_pre

);

	wire	[WIDTH-1:0]	read_data;

	data_memory DM (.clk(clk), .read(mem_read_in), .write(mem_write_in), .addr(alu_result_in), .write_data(write_data_in), .read_data(read_data));

	assign pc_src = branch_in & zero_in;
	assign pc_branch_out = pc_branch_in;

	// For forwarding to ID for Jump.
	//assign	alu_result_pre = alu_result_in;

	always @(posedge clk) begin
		if(reset) begin
			alu_result_out <=0;
			read_data_out <= 0;
			alu_result_out <= 0;
			rd_out <= 0;
			mem_to_reg_out <= 0;
			reg_write_out <= 0;
			
		end
		else begin
			read_data_out <= read_data;
			alu_result_out <= alu_result_in;
			rd_out <= rd_in;
			mem_to_reg_out <= mem_to_reg_in;
			reg_write_out <= reg_write_in;
		end
	end
endmodule
			
