module m1(
  output reg [2:0] Y,
  input wire [7:0] X,
  input wire EN
  );
  always@(X,EN)
    begin
      if(EN)
        casex(X)
          8'b 00000000: Y=3'bzzz;
          8'b 00000001: Y=3'b000;
          8'b 0000001x: Y=3'b001;
          8'b 000001xx: Y=3'b010;
          8'b 00001xxx: Y=3'b011;
          8'b 0001xxxx: Y=3'b100;
          8'b 001xxxxx: Y=3'b101;
          8'b 01xxxxxx: Y=3'b110;
          8'b 1xxxxxxx: Y=3'b111;
          default:      Y=3'bzzz;
        endcase
      end
endmodule
