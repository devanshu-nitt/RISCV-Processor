module forwarding_unit #(	parameter REG_ADDR = 5,
				parameter FWD = 2)(

	input wire 	[REG_ADDR-1:0]	rs1_ex,
	input wire 	[REG_ADDR-1:0]	rs2_ex,

	input wire 	[REG_ADDR-1:0]	rd_mem,
	input wire 			reg_write_mem,

	input wire 	[REG_ADDR-1:0]	rd_wb,
	input wire 			reg_write_wb,

	output reg	[FWD-1:0]	fwd_a,
	output reg	[FWD-1:0]	fwd_b
);

	always @(*) begin
		fwd_a = 0;
		fwd_b = 0;

		if((reg_write_mem) && (rd_mem !=0) && (rd_mem == rs1_ex)) begin
			fwd_a = 2'b10;
		end

		if((reg_write_mem) && (rd_mem !=0) && (rd_mem == rs2_ex)) begin
			fwd_b = 2'b10;
		end

		if((reg_write_wb) && (rd_wb !=0) && (rd_wb == rs1_ex) && !((reg_write_mem) && (rd_mem !=0) && (rd_mem == rs1_ex))) begin
			fwd_a = 2'b01;
		end

		if((reg_write_wb) && (rd_wb !=0) && (rd_wb == rs2_ex) && !((reg_write_mem) && (rd_mem !=0) && (rd_mem == rs2_ex))) begin
			fwd_b = 2'b01;
		end
	end

endmodule
