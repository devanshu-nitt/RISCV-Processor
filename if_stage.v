module if_stage #(	parameter PC =8,
			parameter INST = 32)(
	
	input	wire	clk,
	input	wire	reset,
	input	wire	pc_src,
	input	wire	stall,
	input	wire	[PC-1:0]	pc_jump,

	input 	wire			flush,
	
	output	reg	[INST-1:0]	instruction_out,
	output	reg	[PC-1:0]	pc_out
);
	
	wire	[PC-1:0]	pc_current;
	wire	[PC-1:0]	pc_next;
	wire	[INST-1:0]	instruction;

	assign	pc_next = pc_current +1;

	wire	[PC-1:0]	pc_in;
	assign	pc_in = (pc_src) ? pc_jump: pc_next; //whether to jump or move to next pc.

	program_counter pc(.clk(clk), .reset(reset), .pc_in(pc_in), .pc_out(pc_current));
	
	instruction_memory inst_mm (.addr(pc_current), .instruction(instruction));
	
	always @(posedge clk) begin
		if(reset || flush) begin
			pc_out <=0;
			instruction_out <=0;
		end
		else if(!stall) begin
			pc_out <= pc_current;
			instruction_out <= instruction;
		end
	end
endmodule
