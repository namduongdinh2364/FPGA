`timescale 1ns / 1ps

module testbench_adder_fp(
    input reg [12:0] i_fp1_test, i_fp2_test,
    output wire [12:0] o_fp_test
);
    reg [12:0] fp1_test, fp2_test;
    fp_adder test(.i_fp_1(fp1_test), .i_fp_2(fp2_test), .o_fp(o_fp_test));

    initial
    begin
        fp1_test = 13'b0000000000000; // +0.00000000 * 2^0 (+0)
        fp2_test = 13'b0000110000000; // +0.10000000 * 2^1 (+1)
        #2;
        fp1_test = 13'b0000000000000; // +0.00000000 * 2^0 (+0)
        fp2_test = 13'b1000110000000; // +0.10000000 * 2^1 (-1)
        #2;
        fp1_test = 13'b0000011111111; // +0.11111111 * 2^0 (+0.999)
        fp2_test = 13'b0000110000000; // +0.10000000 * 2^1 (+1)
        #2;
        fp1_test = 13'b1000111110000; // -0.11110000 * 2^1 (-1.875)
        fp2_test = 13'b0000110000000; // +0.10000000 * 2^1 (+1)
        #2;
        $stop;
    end

    assign i_fp1_test = fp1_test;
    assign i_fp2_test = fp2_test;

endmodule
