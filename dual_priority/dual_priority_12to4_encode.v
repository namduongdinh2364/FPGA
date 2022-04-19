`timescale 1ns / 1ps

module dual_priority_encode (
        input wire [11:0] i_num,
        output reg [3:0] o_result
    );

    always @*
        if (i_num[11])
            o_result = 4'b1100;
        else if (i_num[10])
            o_result = 4'b1011;
        else if (i_num[9])
            o_result = 4'b1010;
        else if (i_num[8])
            o_result = 4'b1001;
        else if (i_num[7])
            o_result = 4'b1000;
        else if (i_num[6])
            o_result = 4'b0111;
        else if (i_num[5])
            o_result = 4'b0110;
        else if (i_num[4])
            o_result = 4'b0101;
        else if (i_num[3])
            o_result = 4'b0100;
        else if (i_num[2])
            o_result = 4'b0011;
        else if (i_num[1])
            o_result = 4'b0010;
        else if (i_num[0])
            o_result = 4'b0001;
        else
            o_result = 4'b0000;
endmodule
