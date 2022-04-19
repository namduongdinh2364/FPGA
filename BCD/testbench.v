`timescale 1ns / 1ps

module testbench_bcd (
    output wire [11:0] result,
    output wire carry
);
    reg [11:0] value;
    reg en;

    bcd_3_digits_top test_bcd(.i_value(value), .i_en(en), .o_result(result), .o_carry(carry));
    
    initial
    begin
        en = 1'b1;
        // value 111
        value = 12'b000100010001;
    end

endmodule
