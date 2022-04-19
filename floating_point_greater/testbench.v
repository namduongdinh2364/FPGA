`timescale 1ns / 1ps

module testbench_floating_point_greater(
    input wire [12:0] in1,
    input wire [12:0] in2,
    output wire o_gt
);
    reg [12:0] i_num1, i_num2;
    floating_point floating1(.i_float1(i_num1), .i_float2(i_num2), .o_res(o_gt));

    initial begin
        i_num1 = 13'b0000110000000; // +0.10000000 * 2^1 (+1)
        i_num2 = 13'b0000111110000; // +0.11110000 * 2^1 (+1.875)
        #1;
        i_num1 = 13'b0000110000000; // +0.10000000 * 2^1 (+1)
        i_num2 = 13'b1000111110000; // -0.11110000 * 2^1 (-1.875)
        #1;
        $stop;
    end

    assign in1 = i_num1;
    assign in2 = i_num2;
endmodule
