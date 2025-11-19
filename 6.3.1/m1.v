module BAI6C(
    input  wire clk,
    input  wire rst,
    output reg [5:0] lights
);

    reg [2:0] state;
    reg [3:0] count;

    // States
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;

    // delays
    parameter SEC5 = 4'b1111;  // 15
    parameter SEC1 = 4'b0011;  // 3

    always @(posedge clk)
    begin
        if (~rst)
        begin
            state <= S0;
            count <= 0;
        end
        else
        begin
            case(state)

                S0: if (count < SEC5)
                    begin
                        state <= S0;
                        count <= count + 1;
                    end
                    else
                    begin
                        state <= S1;
                        count <= 0;
                    end

                S1: if (count < SEC1)
                    begin
                        state <= S1;
                        count <= count + 1;
                    end
                    else
                    begin
                        state <= S2;
                        count <= 0;
                    end

                S2: if (count < SEC1)
                    begin
                        state <= S2;
                        count <= count + 1;
                    end
                    else
                    begin
                        state <= S3;
                        count <= 0;
                    end

                S3: if (count < SEC5)
                    begin
                        state <= S3;
                        count <= count + 1;
                    end
                    else
                    begin
                        state <= S4;
                        count <= 0;
                    end

                S4: if (count < SEC1)
                    begin
                        state <= S4;
                        count <= count + 1;
                    end
                    else
                    begin
                        state <= S5;
                        count <= 0;
                    end

                S5: if (count < SEC1)
                    begin
                        state <= S5;
                        count <= count + 1;
                    end
                    else
                    begin
                        state <= S0;
                        count <= 0;
                    end

                default: state <= S0;

            endcase
        end
    end

    // Output logic
    always @(*)
    begin
        case(state)
            S0: lights = 6'b100001; // Cot1:G; Cot2:R
            S1: lights = 6'b010001; // Cot1:Y; Cot2:R
            S2: lights = 6'b001001; // Cot1:R; Cot2:G
            S3: lights = 6'b001100; // Cot1:R; Cot2:G
            S4: lights = 6'b001010; // Cot1:R; Cot2:Y
            S5: lights = 6'b001001; // Cot1:G; Cot2:R
            default: lights = 6'b100001;
        endcase
    end

endmodule
                                                                    
