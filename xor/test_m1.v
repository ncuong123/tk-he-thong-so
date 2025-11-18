module test_m1(
  input wire a,
  input wire b,
  output wire y
  );
  assign y = ~a&b | a&~b;
endmodule
