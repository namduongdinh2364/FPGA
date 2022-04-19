`timescale 1ns / 1ps

module selection_result
    #(parameter N=8)
    (
        input wire [N-1:0] i_r_num, i_l_num,
        input wire i_select,
        output reg [N-1:0] o_result
    );

    always @* begin
        case(i_select)
            1'b1 : o_result = i_r_num;
            default: o_result = i_l_num;
        endcase
    end

endmodule
