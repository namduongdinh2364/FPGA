`timescale 1ns / 1ps

module top_dual_prio (
        input wire [11:0] i_value,
        output wire [3:0] o_first_prio, o_second_prio
    );

    wire [11:0] decode_first_prio;
    reg [11:0] second_prio_input;
    // Get the first priority
    dual_priority_encode get_prio1_12_4(.i_num(i_value), .o_result(o_first_prio));
    // Get the second priority
    dual_priority_decode get_prio1_4_12(.i_num(o_first_prio), .o_result(decode_first_prio));
    // remove first prio from input
    dual_priority_encode get_prio2_12_4(.i_num(second_prio_input), .o_result(o_second_prio));
    always @*
    begin
        second_prio_input = ~decode_first_prio & i_value;
    end

endmodule
