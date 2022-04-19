`timescale 1ns / 1ps

module testbench_int_to_fp(
    input reg [7:0] i_int_test,
    output wire [12:0] o_fp_test
);
    reg [7:0] int_test;
    int_to_fp test(.i_int(int_test), .o_float(o_fp_test));

    initial
    begin
        int_test = 8'b00000000; // +0
        #2;
        int_test = 8'b10000000; // -0
        #2;
        int_test = 8'b00000001; // +1
        #2;
        int_test = 8'b10000001; // -1
        #2;
        int_test = 8'b01111111; // +127
        #2;
        int_test = 8'b11111111; // -127
        #2;
        $stop;
    end

    assign i_int_test = int_test;

endmodule
