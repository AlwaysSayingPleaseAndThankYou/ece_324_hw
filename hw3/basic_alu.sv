module top(s,a,b,y);
	input [1:0] s;
	input [3:0] a;
	input [3:0] b;
	output [3:0] y;

always@(*) 
	case(s)
		2'b00: y = a + b;
		2'b01: y = a << b[1:0];
		2'b10: y = a & b;
		2'b11: y = 1;	
		
endmodule