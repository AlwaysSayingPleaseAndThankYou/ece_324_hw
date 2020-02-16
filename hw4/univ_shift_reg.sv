// Listing 4.10
module univ_shift_reg
   #(parameter N=8)
   (
    input  logic clk, reset,
    input  logic [1:0] ctrl,
    input  logic [N-1:0] d,
    output logic [N-1:0] q
   );

   //signal declaration
   logic [N-1:0] r_reg, r_next;

   // body
   // register
   always_ff @(posedge clk, posedge reset)
      if (reset)
         r_reg <= 0;
      else
         r_reg <= r_next;

   // next-state logic
   always_comb
      case(ctrl)
        2'b00: r_next = r_reg;                  // no op
        2'b01: r_next = {r_reg[N-2:0], d[0]};   // shift left
        2'b10: r_next = {d[N-1], r_reg[N-1:1]}; // shift right
        default: r_next = d;                    // load
      endcase
   // output logic
   assign q = r_reg;
endmodule