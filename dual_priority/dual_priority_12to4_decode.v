`timescale 1ns / 1ps

module dual_priority_decode (
        input wire [3:0] i_num,
        output reg [11:0] o_result
    );

    always @*
        case (i_num)
            4'b0000: o_result = 12'b000000000000;
            4'b0001: o_result = 12'b000000000001;
            4'b0010: o_result = 12'b000000000010;
            4'b0011: o_result = 12'b000000000100;
            4'b0100: o_result = 12'b000000001000;
            4'b0101: o_result = 12'b000000010000;
            4'b0110: o_result = 12'b000000100000;
            4'b0111: o_result = 12'b000001000000;
            4'b1000: o_result = 12'b000010000000;
            4'b1001: o_result = 12'b000100000000;
            4'b1010: o_result = 12'b001000000000;
            4'b1011: o_result = 12'b010000000000;
            4'b1100: o_result = 12'b100000000000;
            default: o_result = 12'b000000000000;
        endcase
endmodule
