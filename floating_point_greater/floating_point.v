`timescale 1ns / 1ps

module floating_point (
        input wire [12:0] i_float1, i_float2,
        output reg o_res
    );

    wire s1, s2;
    wire [7:0] fracb1, fracb2;
    wire [3:0] exp1, exp2;

    assign s1 = i_float1[12];
    assign s2 = i_float2[12];
    assign fracb1 = i_float1[7:0];
    assign fracb2 = i_float2[7:0];
    assign exp1 = i_float1[11:8];
    assign exp2 = i_float2[11:8];

    always @*
        case ({s1, s2})
            2'b00:
                begin
                    if ({exp1, fracb1} > {exp2, fracb2})
                        o_res = 1'b1;
                    else
                        o_res = 1'b0;
                end
            2'b01: o_res = 1'b1;
            2'b10: o_res = 1'b0;
            2'b11:
                begin
                    if ({exp1, fracb1} < {exp2, fracb2})
                        o_res = 1'b1;
                    else
                        o_res = 1'b0;
                end
            default: o_res = 1'b0;
        endcase
endmodule
