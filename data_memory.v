module data_memory #(	parameter DEPTH = 256,
			parameter WIDTH = 8,
			parameter ADDR = $clog2(DEPTH))(
	input wire clk,
	input wire read,
	input wire write,
	input wire [ADDR-1:0] addr,
	input wire [WIDTH-1:0] write_data,
	output reg [WIDTH-1:0] read_data
);
	reg	[WIDTH-1:0]	mem	[DEPTH-1:0];
	integer i;
	initial begin
		for (i=0; i<DEPTH-1; i=i+1) begin
			mem[i]=0;
		end
	end
	
	always @(posedge clk) begin
		if(write) begin
			mem[addr] <= write_data;
		end
	end
	
	always @(*) begin
		if(read) begin
			read_data = mem[addr];
		end
		else begin
			read_data = 0;
		end
	end
endmodule
