module ex_stage #(	parameter WIDTH = 8,
			parameter ALUCTRL = 4,
			parameter FWD = 2,
			parameter PC = 8,
			parameter REG_ADDR = 5)(
	
	input wire	clk,
	input wire	reset,
	input wire	[WIDTH-1:0]	op1,
	input wire	[WIDTH-1:0]	op2,
	input wire	[WIDTH-1:0]	imm,
	input wire			alu_src,
	input wire	[ALUCTRL-1:0]	alu_ctrl,
	input wire	[PC-1:0]	pc_in,

	//Not to be used in this stage, just move'em forward.
	input wire			mem_read_in,
	input wire			mem_write_in,
	input wire			mem_to_reg_in,
	input wire			reg_write_in,
	input wire			branch_in,
	input wire	[REG_ADDR-1:0]	rd_in,

	//Forwarding Inputs
	input wire	[FWD-1:0]	fwd_a,
	input wire	[FWD-1:0]	fwd_b,
	input wire	[WIDTH-1:0]	ex_mem_result,
	input wire	[WIDTH-1:0]	mem_wb_result,

	output reg	[WIDTH-1:0]	alu_result_out,
	output reg			zero_out,
	output reg	[PC-1:0]	pc_out,
	output reg	[WIDTH-1:0]	src2_raw_out,

	//Not used in EX (here).
	output reg			mem_read_out,
	output reg			mem_write_out,
	output reg			mem_to_reg_out,
	output reg			reg_write_out,
	output reg			branch_out,
	output reg	[REG_ADDR-1:0]	rd_out



);
	wire	[PC-1:0]	pc_branch;
	wire	[WIDTH-1:0]	src1, src2_raw, src2, alu_result;
	wire			zero;
	
	wire	[PC-1:0]	imm_internal;

	assign	imm_internal = imm;

	assign	src1 = (fwd_a == 2'b10)? ex_mem_result : (fwd_a == 2'b01)? mem_wb_result : op1;
	assign	src2_raw = (fwd_b == 2'b10)? ex_mem_result : (fwd_b == 2'b01)? mem_wb_result : op2;

	assign src2 = (alu_src)? imm_internal : src2_raw;

	assign pc_branch = pc_in + imm_internal;

	alu ALU(.a(src1), .b(src2), .alu_ctrl(alu_ctrl), .result(alu_result), .zero(zero));

	always @(posedge clk) begin
		if(reset) begin
			alu_result_out <= 0;
			zero_out <= 0;
			pc_out <= 0;
			src2_raw_out <= 0;
			mem_read_out <= 0;
			mem_write_out <= 0;
			mem_to_reg_out <= 0;
			reg_write_out <= 0;
			branch_out <= 0;
			rd_out <= 0;
		end
		else begin
			alu_result_out <= alu_result;
			zero_out <= zero;
			pc_out <= pc_branch;
			src2_raw_out <= src2_raw;

			//Not used in EX (i.e. here).
			mem_read_out <= mem_read_in;
			mem_write_out <= mem_write_in;
			mem_to_reg_out <= mem_to_reg_in;
			reg_write_out <= reg_write_in;
			branch_out <= branch_in;

			rd_out <= rd_in;
		end
	end

endmodule
