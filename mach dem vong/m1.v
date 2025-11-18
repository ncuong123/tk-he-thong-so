module m1 (
output [3:0] Q,
input clk,
input rst);
reg [3:0] value;
always @(posedge clk)
if (~rst)
  value = 4'b0001;
else
  begin
value <= value<<1;
value [0] <= value [3];
end
assign Q = value;
endmodule
