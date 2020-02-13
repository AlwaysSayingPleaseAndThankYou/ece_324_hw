`timescale 1ns/10ps
module top;
	logic [1:0] s  ;
	logic [3:0] a  ;
	logic [3:0] b  ;
	logic [3:0] y  ;

//positional assign rather than name delcaration
top UUT(s, a, b, y);
int _s, _a, _b;
//where does the assert go? 
assert((y == a[3:0] + b[3:0]) & (s ==0))
	else $error("FAIL: opcode is add(00), input is %b and %b, output is %b",a[3:0],b[3:0], y);
initial begin
	_s = -1
	//will this compare int vs the binary? 
	for (int i = 0; i <= 2'b11; i++) begin
		_s ++;
		for (int j = 0; j <= 4'b1111 ; j++) begin
			_a++
			for (int k = 0; k <= 4'b1111; k++) begin
				_b++
				//can I assign int to logic?
				#10 s = _s, a=_a, b=_b;
			end
		end
	end
	#10 $stop;
end
endmodule