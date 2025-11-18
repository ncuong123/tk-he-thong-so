module m1(
  output wire [7:0] q,
  input wire clk,
  input wire rst,
  input wire [1:0] ctrl,
  input wire [7:0] d
  );
  reg [7:0] s_reg, s_next;
  always @(posedge clk)
    	begin
    	  if(~rst)
    	    s_reg<=0;
  	    else
  	      s_reg<=s_next;
	   end
	always @(ctrl, s_reg)
	 begin
	   case(ctrl)
	     0: s_next=s_reg;
	     1: s_next={d[7],s_reg[7:1]};
	     2: s_next={s_reg[6:0],d[0]};
	     3: s_next=d;
	   endcase
	 end
	 assign q=s_reg;
endmodule
    
