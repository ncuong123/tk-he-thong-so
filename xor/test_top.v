module test_top(output wire [0:0] LEDR,
 reg [1:0] SW// input wire [1:0] SW
);
  
  test_m1 u0(.a(SW[0]),. b(SW[1]),. y(LEDR[0]));
  initial
    begin
        SW[0]=0;
        SW[1]=0;
        #1
        SW[0]=1;
        SW[1]=0;
        #1
        SW[0]=0;
        SW[1]=1;
        #1
        SW[0]=1;
        SW[1]=1;
        #1;
    end
endmodule
