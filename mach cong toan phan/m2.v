module m2(
  output wire carry,
  output wire sum,
  input wire a,
  input wire b,
  input wire c
);
  wire half_carry_0, half_carry_1, half_sum;
  m1 u1 (.carry(half_carry_0),. sum(half_sum),. a(a),. b(b));
  m1 u2 (.carry(half_carry_1),. sum(sum),. a(half_sum),. b(c));
  assign carry = half_carry_0 | half_carry_1;
endmodule
