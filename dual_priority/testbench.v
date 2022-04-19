`timescale 1ns / 1ps

module testbench_prio (
    output wire [3:0] o_ret1, o_ret2
);
    reg [11:0] i_value;
    top_dual_prio test_prio (.i_value(i_value), .o_first_prio(o_ret1), .o_second_prio(o_ret2));

    initial
    begin
        i_value = 12'b000100010001;
        #1;
        $stop;
    end

endmodule