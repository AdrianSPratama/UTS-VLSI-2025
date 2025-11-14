`include "GAN_baseline.v"
`timescale 1ps/1ps

module GAN_baseline_tb;

reg signed [5:0] x1, x2, x3, x4,
w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44, b_l1_1, b_l1_2, b_l1_3, b_l1_4,
w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42, b_l2_1, b_l2_2,
w_l3_11, w_l3_21, b_l3_1,
w_l4_11, b_l4_1,
w_l5_11, b_l5_1,
w_l6_11, w_l6_12, b_l6_1, b_l6_2,
w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24, b_l7_1, b_l7_2, b_l7_3, b_l7_4,
w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44, b_l8_1, b_l8_2, b_l8_3, b_l8_4;

wire signed [31:0] f1, f2, f3, f4;

// Instantiate
GAN_baseline GAN (x1, x2, x3, x4,
    w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44, b_l1_1, b_l1_2, b_l1_3, b_l1_4,
    w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42, b_l2_1, b_l2_2,
    w_l3_11, w_l3_21, b_l3_1,
    w_l4_11, b_l4_1,
    w_l5_11, b_l5_1,
    w_l6_11, w_l6_12, b_l6_1, b_l6_2,
    w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24, b_l7_1, b_l7_2, b_l7_3, b_l7_4,
    w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44, b_l8_1, b_l8_2, b_l8_3, b_l8_4,
    f1, f2, f3, f4
);

initial begin
    $dumpfile("GAN_baseline_tb.vcd");
    $dumpvars(0, GAN_baseline_tb);
    
    // Input X
    x1 = 0; x2 = 1; x3 = 1; x4 = 0;

    // Input weight
    // Layer 1
    w_l1_11 = 6; w_l1_12 = 21; w_l1_13 = 3; w_l1_14 = 18;
    w_l1_21 = -3; w_l1_22 = 16; w_l1_23 = -3; w_l1_24 = 12;
    w_l1_31 = 5; w_l1_32 = -6; w_l1_33 = 15; w_l1_34 = -4;
    w_l1_41 = -16; w_l1_42 = -9; w_l1_43 = -17; w_l1_44 = -8;

    b_l1_1 = 1; b_l1_2 = 0; b_l1_3 = 2; b_l1_4 = -1;

    // Layer 2
    w_l2_11 = 4; w_l2_12 = -14;
    w_l2_21 = 14; w_l2_22 = 14;
    w_l2_31 = 8; w_l2_32 = 9;
    w_l2_41 = 15; w_l2_42 = 15;

    b_l2_1 = 1; b_l2_2 = 4;

    // Layer 3
    w_l3_11 = 14;
    w_l3_21 = 6;

    b_l3_1 = 5;

    // Layer 4
    w_l4_11 = 7;

    b_l4_1 = 10;

    // Layer 5
    w_l5_11 = 1;

    b_l5_1 = -4;

    // Layer 6
    w_l6_11 = -8; w_l6_12 = 14;
    
    b_l6_1 = 20; b_l6_2 = 0;

    // Layer 7
    w_l7_11 = 4; w_l7_12 = 14; w_l7_13 = 8; w_l7_14 = 15;
    w_l7_21 = -14; w_l7_22 = 14; w_l7_23 = 9; w_l7_24 = 15;

    b_l7_1 = 5; b_l7_2 = 3; b_l7_3 = 1; b_l7_4 = 2;

    // Layer 8
    w_l8_11 = 11; w_l8_12 = -7; w_l8_13 = 10; w_l8_14 = -7;
    w_l8_21 = 9; w_l8_22 = -6; w_l8_23 = 11; w_l8_24 = -7;
    w_l8_31 = 10; w_l8_32 = -15; w_l8_33 = -5; w_l8_34 = 7;
    w_l8_41 = 1; w_l8_42 = 17; w_l8_43 = 4; w_l8_44 = 12;

    b_l8_1 = -10; b_l8_2 = 10; b_l8_3 = 10; b_l8_4 = -10;

    #20;

    if (f1 != 162628187) begin
        $display("FAIL at f1, expected 238012727, RTL: %d", f1);
    end
    else if (f2 != 25344659) begin
        $display("FAIL at f2, expected 37092899, RTL: %d", f2);
    end
    else if (f3 != 118979088) begin
        $display("FAIL at f3, expected 174130548, RTL: %d", f3);
    end
    else if (f4 != 102082610) begin
        $display("FAIL at f4, expected 149401910, RTL: %d", f4);
    end
    else begin
      $display("PASS");
    end
end

endmodule