module mux_2_to_1 #(parameter N=8)(
	input wire	[N-1:0]	in0,
	input wire	[N-1:0]	in1,
	input wire	sel,
	output wire	[N-1:0]	out
);
	assign out = (sel)? in1:in0;
endmodule