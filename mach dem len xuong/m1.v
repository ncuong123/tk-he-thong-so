module m1(
output [3:0] q,
input clk,
input rst,
input up_down
  );
  reg [3:0] value;
  always @(posedge clk)
    begin
      if(~rst)
        value<=4'h0;
      else if(~up_down)
        value<=value + 4'd1;
      else
        value<=value-4'd1;
    	end
 	assign q=value;

endmodule
