module m1(
  output wire carry,
  output wire sum,
  input wire a,
  input wire b
  );
  assign sum = a^b;
  assign carry = a&b;
endmodule
