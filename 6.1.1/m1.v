module m1 (
input wire x,
input wire rst,
input wire clk,
output reg w);
parameter [2:0] A = 3'b 000, B = 3'b 001, C = 3'b 010, D = 3'b 011, E = 3'b 100;
reg [2:0] p_state, n_state; // present and next states, respectively.
always @(x or p_state) begin: Transitions
n_state = A; //Reset state
case (p_state)
  A:
    if (x== 1'b1) n_state = B ;
    else n_state = A;
  B:
    if (x== 1'b1) n_state = B ; 
    else n_state = C;
  C:
    if (x==1'b1) n_state = D;
    else n_state = A;
  D:
    if (x==1'b1) n_state = E ;
    else n_state = C;
  E:
    if (x== 1'b1) n_state = B;
    else n_state = C;
  default:
    n_state=A; // reset state
endcase
end
always @(x or p_state) begin: Outputing
  w=1'b0;
  w=(p_state == E);
end
always @(posedge clk) begin: Registering
  if(~rst) p_state=A;
  else p_state=n_state;
  end
endmodule
