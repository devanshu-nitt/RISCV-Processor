module hazard_detection_unit #(	parameter REG_ADDR = 5)(
	
	input wire	[REG_ADDR-1:0]	rs1_id,
	input wire	[REG_ADDR-1:0]	rs2_id,
	input wire			branch_id,

	input wire	[REG_ADDR-1:0]	rd_ex,
	input wire			reg_write_ex,
	input wire			mem_read_ex,

	input wire	[REG_ADDR-1:0]	rd_mem,
	input wire			reg_write_mem,

	output reg			stall
);

	wire	match_rs1_ex = (rs1_id == rd_ex) && (rd_ex !=0);
	wire	match_rs2_ex = (rs2_id == rd_ex) && (rd_ex !=0);
	wire	match_rs1_mem = (rs1_id == rd_mem) && (rd_mem !=0);
	wire	match_rs2_mem = (rs1_id == rd_mem) && (rd_mem !=0);

	always @(*) begin
		stall = 0;
		
		if(mem_read_ex && (match_rs1_ex || match_rs2_ex)) stall = 1; // For Load instruction in EX stage.
		else if (branch_id && reg_write_ex && (match_rs1_ex || match_rs2_ex)) stall = 1; // For Jump instruction in ID and register manipulator instruction in EX.
		else if (branch_id && reg_write_mem && (match_rs1_ex || match_rs2_ex)) stall = 1; // For Jump instruction in ID and register manipulator instruction in MEM.
	end

endmodule
