// Leveraged from Chu Listing 7.7
// Revisions:
// 24 Dec 2018 Pritchard: Simplified, and added some assertions

module fifo_ctrl #(parameter ADDR_WIDTH=4) ( // number of address bits
	input  logic clk, reset,
    input  logic rd, wr,
    output logic empty, full,
    output logic [ADDR_WIDTH-1:0] w_addr, r_addr
);
logic [ADDR_WIDTH-1:0] w_addrP1, r_addrP1;
assign w_addrP1 = w_addr + 1; assign r_addrP1 = r_addr + 1;

always_ff @(posedge clk, posedge reset) begin
	if (reset) begin w_addr <= 0; r_addr <= 0; full <= 1'b0; empty <= 1'b1; end
	else case({wr,rd})
		2'b01: if (~empty) begin  // read-only and not empty
			r_addr <= r_addrP1; full  <= 0; if (r_addrP1 == w_addr) empty <= 1; 
		end
		2'b10: if (~full) begin  // write-only and not full
			w_addr <= w_addrP1; empty <= 0; if (w_addrP1 == r_addr) full  <= 1; 
		end
		2'b11: begin w_addr <= w_addrP1; r_addr <= r_addrP1; end // write and read
		default: ; // 2'b00; null statement; no op
	endcase
	
	// assertions that should never happen, based on the design
	assert (($time == 0) | ((full | empty) ^ (w_addr != r_addr))) 
	       else $error("wr and rd pointers should only be the same when FIFO is full or empty.");	
	// assertions which the testbench may do, but shouldn't happen in the target application.
	assert (!(empty & rd)) else $warning("read attempted when FIFO is empty.");
end
endmodule

