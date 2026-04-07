module id_stage #(	parameter INST = 32,
			parameter WIDTH = 8,
			parameter ADDR = 5,
			parameter ALUCTRL = 4,
			parameter OPCODE = 7,
			parameter FUNC3 = 3,
			parameter FUNC7 = 7,
			parameter ALUOP = 2,
			parameter PC = 8)(
	
	input wire 	clk,
	input wire	reset,

	input wire	[PC-1:0]	pc_in,
	input wire	[INST-1:0]	instruction,
	input wire	[WIDTH-1:0]	write_data,
	input wire	[ADDR-1:0]	rd_wb,
	input wire			reg_write_wb,

	output reg	[WIDTH-1:0]	read_data1_out,
	output reg	[WIDTH-1:0]	read_data2_out,
	output reg	[WIDTH-1:0]	imm_out,
	output reg	[ALUCTRL-1:0]	alu_ctrl_out,

	output reg			reg_write_out,
	output reg			mem_read_out,
	output reg			mem_write_out,
	output reg			mem_to_reg_out,
	output reg			alu_src_out,
	output reg			branch_out,
	output reg			rd_out,
	output reg			pc_out
);

	wire	[WIDTH-1:0]	read_data1;
	wire	[WIDTH-1:0]	read_data2;
	wire	[WIDTH-1:0]	imm;
	wire	[ALUCTRL-1:0]	alu_ctrl;
	wire			alu_src;

	wire	[OPCODE-1:0]	opcode =instruction[6:0];
	wire	[ADDR-1:0]	rs1 =instruction[19:15];
	wire	[ADDR-1:0]	rs2 =instruction[24:20];
	wire	[ADDR-1:0]	rd_internal =instruction[11:7];
	wire	[FUNC3-1:0]	func3 =instruction[14:12];
	wire	[FUNC7-1:0]	func7 =instruction[31:25];

	wire	[ALUOP-1:0]	alu_op;
	wire	[ADDR-1:0]	rd;

	assign	rd = rd_internal;

	control_unit CU(.opcode(opcode), .reg_write(reg_write), .mem_read(mem_read), .mem_write(mem_write), .mem_to_reg(mem_to_reg), .alu_src(alu_src), .branch(branch), .alu_op(alu_op));
	
	register_file RF(.clk(clk), .rst(rst), .reg_write(reg_write_wb), .rs1(rs1), .rs2(rs2), .rd(rd_wb), .write_data(write_data), .read_data1(read_data1), .read_data2(read_data2));

	imm_gen IG(.instruction(instruction), .imm_out(imm));

	alu_control AC(.alu_op(alu_op), .func3(func3), .func7(func7), .alu_ctrl(alu_ctrl));

	always @(posedge clk) begin
		if(reset) begin
			read_data1_out <=0;
			read_data2_out <=0;
			imm_out <=0;
			alu_ctrl_out <=0;
			reg_write_out <=0;
			mem_read_out <=0;
			mem_write_out <=0;
			mem_to_reg_out <=0;
			alu_src_out <=0;
			branch_out <=0;
			rd_out <=0;
			pc_out <=0;
		end
		else begin
			pc_out <= pc_in;
			read_data1_out <= read_data1;
			read_data2_out <= read_data2;
			imm_out <= imm;
			alu_ctrl_out <= alu_ctrl;
			alu_src_out <= alu_src;
		end
	end

endmodule

