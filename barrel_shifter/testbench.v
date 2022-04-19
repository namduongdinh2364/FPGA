`timescale 1ns / 1ps

module testbench_shifter (
    output wire [15:0] o_value
);
    reg [15:0] i_value;
    reg [2:0] i_value_rot;
    reg i_buttom;
    wire [15:0] ret_r, ret_l;
    rotation_right_shifter #(.N(16)) r_res (.i_num(i_value), .i_num_bit_rotation(i_value_rot), .o_result(ret_r));
    rotation_left_shifter #(.N(16)) l_res (.i_num(i_value), .i_num_bit_rotation(i_value_rot), .o_result(ret_l));
    selection_result #(.N(16)) s_mux (.i_r_num(ret_r), .i_l_num(ret_l), .i_select(i_buttom), .o_result(o_value));

    initial
        begin
            i_value = 16'b0000000000000110;
            i_value_rot = 3'b001;
            i_buttom = 1'b0;
            #5;
            i_value = 16'b0000000000000110;
            i_value_rot = 3'b001;
            i_buttom = 1'b1;
            #5;
            $stop;
        end

endmodule