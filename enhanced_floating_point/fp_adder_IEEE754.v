`timescale 1ns / 1ps

module fp_adder (
        input wire [12:0]i_fp_1, i_fp_2,
        output reg [12:0] o_fp
    );

    reg guard, round;
    reg [2:0] sticky;

    reg signb, signs;
    reg [3:0] expb , exps , expn , exp_diff;
    reg [7:0] fracb, fracs, fraca, fracn, fraca_r;
    reg [8:0] sum;
    reg [2:0] lead;

    always @*
    begin
        if ({i_fp_1[11:8], i_fp_1[7:0]} > {i_fp_2[11:8], i_fp_2[7:0]})
        begin
            signb = i_fp_1[12];
            signs = i_fp_2[12];
            expb = i_fp_1[11:8];
            exps = i_fp_2[11:8];
            fracb = i_fp_1[7:0];
            fracs = i_fp_2[7:0];
        end
        else
        begin
            signb = i_fp_2[12];
            signs = i_fp_1[12];
            expb = i_fp_2[11:8];
            exps = i_fp_1[11:8];
            fracb = i_fp_2[7:0];
            fracs = i_fp_1[7:0];
        end

        sticky = fracs[2:0];
        round = fracs[3];
        guard = fracs[4];
        exp_diff = expb - exps;
        fraca = fracs >> exp_diff;

        if (exp_diff > 0)
        begin
            casez ({guard, round, sticky})
                // round to the nearest even
                5'b10000:
                begin
                    if (fraca[0] == 1'b1)
                        fraca_r = fraca + 1;
                end
                // round up
                5'b1???1:
                    fraca_r = fraca + 1;
                default: fraca_r = fraca;
            endcase
        end
        else
            fraca_r = fraca;

        if (signb == signs)
            sum = {1'b0, fracb} + {1'b0, fraca_r};
        else
            sum = {1'b0, fracb} - {1'b0, fraca_r};

        if (sum[7])
            lead = 3'b000;
        else if (sum[6])
            lead = 3'b001;
        else if (sum[5])
            lead = 3'b010;
        else if (sum[4])
            lead = 3'b011;
        else if (sum[3])
            lead = 3'b100;
        else if (sum[2])
            lead = 3'b101;
        else if (sum[1])
            lead = 3'b110;
        else
            lead = 3'b111;

        if (sum[8])
        begin
            fracn = sum[8:1];
            expn = expb + 1;
        end
        else if (lead > expb)
        begin
            fracn = 0;
            expn = 0;
        end
        else
        begin
            fracn = sum << lead;
            expn = expb - lead;
        end

        o_fp = {signb, expn, fracn};
    end
endmodule
