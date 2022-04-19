`timescale 1ns / 1ps

module rotation_right_shifter
    #(parameter N=8)
    (
        input wire [N-1:0] i_num,
        input wire [2:0] i_num_bit_rotation,
        output reg [N-1:0] o_result
    );

    reg [N-1:0] res0, res1;
    always @*
    begin
        res0 = i_num_bit_rotation[0] ? {i_num[0], i_num[N-1:1]} : i_num;
        res1 = i_num_bit_rotation[1] ? {res0[1:0], res0[N-1:2]} : res0;
        o_result = i_num_bit_rotation[2] ? {res1[3:0], res1[N-1:4]} : res1;
    end
endmodule
