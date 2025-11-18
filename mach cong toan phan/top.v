module top(output wire [1:0] LEDR,
  reg [2:0] SW //input wire
);
  
  m2 u0(.carry(LEDR[1]),. sum(LEDR[0]),. a(SW[0]),. b(SW[1]),. c(SW[2]));
  initial
    begin
        SW[0]=0;
        SW[1]=0;
        SW[2]=0;
        #1
        SW[0]=1;
        SW[1]=0;
        SW[2]=0;
        #1
        SW[0]=0;
        SW[1]=1;
        SW[2]=0;
        #1
        SW[0]=1;
        SW[1]=1;
        SW[2]=0;
        #1
        SW[0]=0;
        SW[1]=0;
        SW[2]=1;
        #1
        SW[0]=1;
        SW[1]=0;
        SW[2]=1;
        #1
        SW[0]=0;
        SW[1]=1;
        SW[2]=1;
        #1
        SW[0]=1;
        SW[1]=1;
        SW[2]=1;
        #1;
    end
endmodule
