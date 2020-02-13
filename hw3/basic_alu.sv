module basic_alu(s,a,b,y);
	input logic [1:0] s;
	input logic [3:0] a;
	input logic [3:0] b;
	output logic [3:0] y;

always@(*)
	case(s)
		2'b00: y = a + b;
		2'b01: y = a << b[1:0];
		2'b10: y = a & b;
		2'b11: y = 1;	

		
endmodule		
