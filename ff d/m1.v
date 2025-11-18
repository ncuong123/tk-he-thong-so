module m1(
  input wire d,
  input clk,
  output reg q,
  input reset
  );
  always@(posedge clk)
    begin
      if(~reset)
        q=1'b0;
      else 
        q=d;
    end
endmodule
