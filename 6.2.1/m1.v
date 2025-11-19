module m1(
    input  wire x,
    input  wire clk,
    input  wire rst,
    output reg  w
);

    // State encoding
    parameter [1:0] A = 2'b00,
                    B = 2'b01,
                    C = 2'b10,
                    D = 2'b11;

    reg [1:0] p_state, n_state;   // present state & next state

    // ---------- NEXT-STATE LOGIC ----------
    always @(x or p_state) begin
        n_state = A;  // default reset state
        case (p_state)
            A: begin
                if (x == 1'b1) n_state = B;
                else n_state = A;
            end
            B: begin
                if (x == 1'b1) n_state = B;
                else n_state = C;
            end
            C: begin
                if (x == 1'b1) n_state = D;
                else n_state = A;
            end
            D: begin
                if (x == 1'b1) n_state = B;
                else n_state = C;
            end
            default: n_state = A;
        endcase
    end

    // ---------- OUTPUT LOGIC ----------
    always @(x or p_state) begin
        w = 1'b0;
        w = (p_state == D) & (x == 1'b1);
    end

    // ---------- STATE REGISTER ----------
    always @(posedge clk) begin
        if (~rst)
            p_state = A;    // synchronous reset
        else
            p_state = n_state;
    end

endmodule

