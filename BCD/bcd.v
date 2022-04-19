`timescale 1ns / 1ps

module bcd_incrementor (
        input wire [3:0] i_num,
        input wire i_carry_in,
        output reg [3:0] o_result,
        output reg o_carry_out
    );

    reg [4:0] ret1;
    always @*
    begin
        if (i_carry_in) begin
            case (i_num)
                4'b0000: ret1 = 5'b00001;
                4'b0001: ret1 = 5'b00010;
                4'b0010: ret1 = 5'b00011;
                4'b0011: ret1 = 5'b00100;
                4'b0100: ret1 = 5'b00101;
                4'b0101: ret1 = 5'b00110;
                4'b0110: ret1 = 5'b00111;
                4'b0111: ret1 = 5'b01000;
                4'b1000: ret1 = 5'b01001;
                4'b1001: ret1 = 5'b10000;
                default: ret1 = 5'b00000;
            endcase
            end
        else    begin
            ret1 = {1'b0, i_num};
            end

        o_result = ret1[3:0];
        o_carry_out = ret1[4];
    end
endmodule
