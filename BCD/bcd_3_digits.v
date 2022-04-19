`timescale 1ns / 1ps

module bcd_3_digits_top (
    input wire [11:0] i_value,
    input wire i_en,
    output reg [11:0] o_result,
    output reg o_carry
);
    wire [3:0] ret1, ret2, ret3;
    wire carry_ret1, carry_ret2, carry_ret3;

    bcd_incrementor digit1(.i_num(i_value[3:0]), .i_carry_in(i_en), .o_result(ret1), .o_carry_out(carry_ret1));
    bcd_incrementor digit2(.i_num(i_value[7:4]), .i_carry_in(carry_ret1), .o_result(ret2), .o_carry_out(carry_ret2));
    bcd_incrementor digit3(.i_num(i_value[11:8]), .i_carry_in(carry_ret2), .o_result(ret3), .o_carry_out(carry_ret3));
   
    always @*
    begin
        o_result = {ret3, ret2, ret1};
        o_carry = carry_ret3;
    end

endmodule
