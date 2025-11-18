module top(output wire [2:0] LEDR,
  reg [7:0] SW //input wire
);
  reg enb;
  m1 u0(.Y(LEDR),. X(SW),.EN(enb));
  initial
    begin
      enb=1;
      SW=0;
      #1
      SW=1;
      #1
      SW=2;
      #1
      SW=4;
      #1
      SW=8;
      #1
      SW=16;
      #1
      SW=32;
      #1
      SW=64;
      #1
      SW=128;
      #1
      enb=0;
      #1;
    end
endmodule

