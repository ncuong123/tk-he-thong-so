module test_top(output wire [1:0] LEDR,
  reg [1:0] SW //input wire
);
  
  test_m1 u0(.carry(LEDR[1]),. sum(LEDR[0]),. a(SW[0]),. b(SW[1]));
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
