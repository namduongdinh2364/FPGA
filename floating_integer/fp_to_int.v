`timescale 1ns / 1ps

module fp_to_int (
        input wire [12:0] i_fp,
        output reg [7:0] o_int,
        output reg uf, of
    );

    reg [7:0] int_magnitude;
    reg [3:0] f_exp;
    reg [7:0] f_frac;
    reg [3:0] lead;

    always @*
    begin
        f_exp = i_fp[11:8];
        f_frac = i_fp[7:0];
        lead = 8 - f_exp;
        of = 1'b0;
        uf = 1'b0;


        if (f_frac == 8'b00000000)
            int_magnitude = 8'b00000000;
        // overflow condition
        else if (f_exp > 4'b0111)
        begin
            int_magnitude = 8'b00000000;
            of = 1'b1;
        end
        // smaller
        else if (f_exp < 4'b0001)
        begin
            int_magnitude = 8'b00000000;
            uf = 1'b1;
        end
        else
            int_magnitude = f_frac >> lead;
        
        o_int = {i_fp[12], int_magnitude[6:0]};

    end
endmodule
