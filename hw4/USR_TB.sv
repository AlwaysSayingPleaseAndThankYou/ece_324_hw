module hw4(
	input logic clk,

	);

logic reset;
logic ctrl;
reg d;
logic q; 

univ_shift_reg #((.N(4)) USR(
	.clk(clk),
	.reset(reset),
	.ctrl(ctrl),
	.d(d),
	.q(q)
	);

initial begin

