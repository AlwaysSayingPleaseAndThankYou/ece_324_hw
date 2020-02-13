`timescale 1ns/10ps
module top;
	logic [1:0] s;
	logic [3:0] a;
	logic [3:0] b;
	logic [3:0] y;

//positional assign rather than name delcaration
top UUT(.s(s),.a(a),.b(b),.y(y));
	int _s = 0;
	int _a = 0;
	int _b = 0;
//where does the assert go?
	//assert((y == a[3:0] + b[3:0]) & (s ==0))
		//else $error("FAIL: opcode is add(00), input is %b and %b, output is %b",a,b, y);
	initial begin
			for (int i = 0; i <= 3; i++) begin
				_s ++;
				for (int j = 0; j <= 15; j++) begin
					_a++;
						for (int k = 0; k <= 15; k++) begin
							_b++;
								//can I assign int to logic?
								// this should be fine
								#10 s = _s; a=_a; b=_b;
						end
				end
			end
		#10 $stop;
	end
endmodule