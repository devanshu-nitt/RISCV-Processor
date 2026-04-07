module instruction_memory #(	parameter DEPTH = 256,
				parameter INST = 32,
				parameter ADDR = $clog2(DEPTH))(
	input wire	[ADDR-1:0] addr,
	output wire 	[INST-1:0] instruction
);
	reg	[INST-1:0]	inst [0:DEPTH-1];
	
	initial begin
		inst[0] = 32'b000000000000_00000_000_00001_0010011;
		inst[0] = 32'b000000000001_00001_000_00010_0010011;
		inst[0] = 32'b0000000_00010_00001_000_00011_0110011;
	end
	assign instruction = inst[addr];
endmodule