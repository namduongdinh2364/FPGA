`timescale 1ns / 1ps

module testbench_fp_to_int(
    input reg [12:0] i_fp_test,
    output wire [7:0] o_int_test,
    output wire uf_test, of_test
);
    reg [12:0] fp;
    fp_to_int test(.i_fp(fp), .o_int(o_int_test), .uf(uf_test), .of(of_test));

    initial
    begin
        fp = 13'b0000000000000; // +0.00000000 * 2^0 (+0)
        #2;
        fp = 13'b1000000000000; // -0.00000000 * 2^0 (-0)
        #2;
        fp = 13'b0000011111111; // +0.11111111 * 2^0 (+0.999)
        #2;
        fp = 13'b1000011111111; // -0.11111111 * 2^0 (-0.999)
        #2;
        fp = 13'b0000110000000; // +0.10000000 * 2^1 (+1)
        #2;
        fp = 13'b1000110000000; // -0.10000000 * 2^1 (-1)
        #2;
        fp = 13'b0000111110000; // +0.11110000 * 2^1 (+1.875)
        #2;
        fp = 13'b1000111110000; // -0.11110000 * 2^1 (-1.875)
        #2;
        $stop;
    end

    assign i_fp_test = fp;

endmodule
