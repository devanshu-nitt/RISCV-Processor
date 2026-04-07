module register_file #(	parameter DEPTH = 32,
			parameter WIDTH = 8,
			parameter ADDR = $clog2(DEPTH))(
	
	input wire	clk,
	input wire	reset,
	input wire	reg_write,
	input wire	[ADDR-1:0]	rs1,
	input wire	[ADDR-1:0]	rs2,
	input wire	[ADDR-1:0]	write_addr,
	input wire	[WIDTH-1:0]	write_data,
	output reg	[WIDTH-1:0]	read_data1,
	output reg	[WIDTH-1:0]	read_data2
);
	reg [WIDTH-1:0]	registers	[DEPTH-1:0];
	integer i;
	always @(posedge clk) begin
		if(reset) begin
			for(i=0; i< DEPTH-1; i=i+1) begin
				registers[i] <= 0;
			end
		end
		else begin
			if(reg_write && write_addr !=0) begin
				registers[write_addr] <= write_data;
			end
		end
	end
	assign read_data1 = registers[rs1];
	assign read_data2 = registers[rs2];
endmodule