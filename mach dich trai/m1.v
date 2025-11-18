module m1(
  output reg [3:0] q,
  input wire d,
  input wire clk,
  input wire reset
  );
  always @(posedge clk)
    if(~reset)
      q<=4'b0;
    else
      q<={q[2:0],d};
endmodule
