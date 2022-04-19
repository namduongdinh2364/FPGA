`timescale 1ns / 1ps

module int_to_fp (
        input wire [7:0] i_int,
        output reg [12:0] o_float
    );

    reg [6:0] int_magnitude;
    reg [3:0] f_exp;
    reg [7:0] f_frac;
    reg [3:0] lead;

    always @*
    begin
        if (i_int[6])
            f_exp = 4'b0111;
        else if (i_int[5])
            f_exp = 4'b0110;
        else if (i_int[4])
            f_exp = 4'b0101;
        else if (i_int[3])
            f_exp = 4'b0100;
        else if (i_int[2])
            f_exp = 4'b0011;
        else if (i_int[1])
            f_exp = 4'b0010;
        else if (i_int[0])
            f_exp = 4'b0001;
        else
            f_exp = 4'b0000;
        
        lead = 8 - f_exp;
        // normalize
        int_magnitude = i_int[6:0];
        f_frac = int_magnitude << lead;

        o_float = {i_int[7], f_exp, f_frac};
    end
endmodule
