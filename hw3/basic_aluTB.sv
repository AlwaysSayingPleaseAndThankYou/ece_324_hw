`timescale 1ns/10ps
module basic_aluTB;
	logic [1:0] s;
	logic [3:0] a;
	logic [3:0] b;
	logic [3:0] y;

//basic_alu UUT(.s(s),.a(a),.b(b),.y(y));
basic_alu UUT(s,a,b,y);

int _s = -1;
int _a = -1;
int _b = -1;
//where does the assert go?
	//assert((y == a[3:0] + b[3:0]) & (s ==0))
		//else $error("FAIL: opcode is add(00), input is %b and %b, output is %b",a,b, y);
	initial begin
			for (int i = 0; i <= 3; i++) begin
				_s++;
				for (int j = 0; j <= 15; j++) begin
					_a++;
					for (int k = 0; k <= 15; k++) begin
						_b++;
                        #10 s=_s; a=_a; b=_b;
                    end
				end
			end
		#10 $stop;
	end
endmodule