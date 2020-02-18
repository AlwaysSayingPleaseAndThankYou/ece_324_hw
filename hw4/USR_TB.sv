module hw4();

// to control clock speed
localparam T = 20;
reg clk, reset;
logic [1:0] ctrl;
reg [N-1:0] d;
logic [N-1:0] q; 

// generate a clock signal, and apply a stimulus sequence to the USR inputs.
// Use the testbench clock to control when the stimulus signals change.
// Use Chu’s Testbench for a universal binary counter (Listing 4.14)
// as an example.  


univ_shift_reg #((.N(4)) USR(
	.clk(clk),
	.reset(reset),
	.ctrl(ctrl),
	.d(d),
	.q(q)
	);


//instatiate the clock 10ns
always begin
	clk = 1'b1;
	#(T/2);
	clk = 1'b0;
	#(T/2);
end

// reset at startup
initial begin 
	reset = 1'b1;
	#(T/2);
	reset = 1'b0;
end 

//testing for opcode 00
initial begin
	@(negedge reset);
	@(negedge clk);
	ctrl = 2'b11;
	d = 4'd1010;
	// this should do 4 shift lefts? 
	@(negedge clk);
	ctrl = 2'b01;
	repeat(4) @(negedge clk);
	@(negedge clk);
	ctrl = 2'b11;
	d = 4'b0101;
	//this should test shift right
	@(negedge clk);
	ctrl = 2'b10;
	repeat(4) @(negedge clk);
	//hold for ten cycles
	@(negedge clk);
	ctrl = 2'b00;
	repeat (10) @(negedge clk);
	$stop;
end
endmodule : hw4

//TODO: async reset!?!?






