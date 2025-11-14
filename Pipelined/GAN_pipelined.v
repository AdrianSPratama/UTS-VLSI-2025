`include "neuron_4input_pipelined.v"
`include "neuron_2input_pipelined.v"
`include "neuron_1input_pipelined.v"

module GAN_pipelined (x1, x2, x3, x4,
                     w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44, b_l1_1, b_l1_2, b_l1_3, b_l1_4,
                     w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42, b_l2_1, b_l2_2,
                     w_l3_11, w_l3_21, b_l3_1,
                     w_l4_11, b_l4_1,
                     w_l5_11, b_l5_1,
                     w_l6_11, w_l6_12, b_l6_1, b_l6_2,
                     w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24, b_l7_1, b_l7_2, b_l7_3, b_l7_4,
                     w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44, b_l8_1, b_l8_2, b_l8_3, b_l8_4,
                     f1, f2, f3, f4, enable, clock, reset);

input enable, clock, reset;
input [5:0] x1, x2, x3, x4,
w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44, b_l1_1, b_l1_2, b_l1_3, b_l1_4,
w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42, b_l2_1, b_l2_2,
w_l3_11, w_l3_21, b_l3_1,
w_l4_11, b_l4_1,
w_l5_11, b_l5_1,
w_l6_11, w_l6_12, b_l6_1, b_l6_2,
w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24, b_l7_1, b_l7_2, b_l7_3, b_l7_4,
w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44, b_l8_1, b_l8_2, b_l8_3, b_l8_4;

output [31:0] f1, f2, f3, f4;

wire enable, clock, reset;
wire signed [5:0] x1, x2, x3, x4,
w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44, b_l1_1, b_l1_2, b_l1_3, b_l1_4,
w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42, b_l2_1, b_l2_2,
w_l3_11, w_l3_21, b_l3_1,
w_l4_11, b_l4_1,
w_l5_11, b_l5_1,
w_l6_11, w_l6_12, b_l6_1, b_l6_2,
w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24, b_l7_1, b_l7_2, b_l7_3, b_l7_4,
w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44, b_l8_1, b_l8_2, b_l8_3, b_l8_4;

wire signed [31:0] f1, f2, f3, f4;

// LAYER 1
wire signed [31:0] out_neuron_l1_1;
neuron_4input_pipelined neuron_l1_1 (
    x1, x2, x3, x4, w_l1_11, w_l1_21, w_l1_31, w_l1_41, b_l1_1, out_neuron_l1_1, enable, clock, reset
);

wire signed [31:0] out_neuron_l1_2;
neuron_4input_pipelined neuron_l1_2 (
    x1, x2, x3, x4, w_l1_12, w_l1_22, w_l1_32, w_l1_42, b_l1_2, out_neuron_l1_2, enable, clock, reset
);

wire signed [31:0] out_neuron_l1_3;
neuron_4input_pipelined neuron_l1_3 (
    x1, x2, x3, x4, w_l1_13, w_l1_23, w_l1_33, w_l1_43, b_l1_3, out_neuron_l1_3, enable, clock, reset
);

wire signed [31:0] out_neuron_l1_4;
neuron_4input_pipelined neuron_l1_4 (
    x1, x2, x3, x4, w_l1_14, w_l1_24, w_l1_34, w_l1_44, b_l1_4, out_neuron_l1_4, enable, clock, reset
);

// LAYER 2
wire signed [31:0] out_neuron_l2_1;
neuron_4input_pipelined neuron_l2_1 (
    out_neuron_l1_1, out_neuron_l1_2, out_neuron_l1_3, out_neuron_l1_4, w_l2_11, w_l2_21, w_l2_31, w_l2_41, b_l2_1, out_neuron_l2_1, enable, clock, reset
);

wire signed [31:0] out_neuron_l2_2;
neuron_4input_pipelined neuron_l2_2 (
    out_neuron_l1_1, out_neuron_l1_2, out_neuron_l1_3, out_neuron_l1_4, w_l2_12, w_l2_22, w_l2_32, w_l2_42, b_l2_2, out_neuron_l2_2, enable, clock, reset
);

// LAYER 3
wire signed [31:0] out_neuron_l3_1;
neuron_2input_pipelined neuron_l3_1 (
    out_neuron_l2_1, out_neuron_l2_2, w_l3_11, w_l3_21, b_l3_1, out_neuron_l3_1, enable, clock, reset
);

// LAYER 4
wire signed [31:0] out_neuron_l4_1;
neuron_1input_pipelined neuron_l4_1 (
    out_neuron_l3_1, w_l4_11, b_l4_1, out_neuron_l4_1, enable, clock, reset
);

// LAYER 5
wire signed [31:0] out_neuron_l5_1;
neuron_1input_pipelined neuron_l5_1 (
    out_neuron_l4_1, w_l5_11, b_l5_1, out_neuron_l5_1, enable, clock, reset
);

// LAYER 6
wire signed [31:0] out_neuron_l6_1;
neuron_1input_pipelined neuron_l6_1 (
    out_neuron_l5_1, w_l6_11, b_l6_1, out_neuron_l6_1, enable, clock, reset
);

wire signed [31:0] out_neuron_l6_2;
neuron_1input_pipelined neuron_l6_2 (
    out_neuron_l5_1, w_l6_12, b_l6_2, out_neuron_l6_2, enable, clock, reset
);

// LAYER 7
wire signed [31:0] out_neuron_l7_1;
neuron_2input_pipelined neuron_l7_1 (
    out_neuron_l6_1, out_neuron_l6_2, w_l7_11, w_l7_21, b_l7_1, out_neuron_l7_1, enable, clock, reset
);

wire signed [31:0] out_neuron_l7_2;
neuron_2input_pipelined neuron_l7_2 (
    out_neuron_l6_1, out_neuron_l6_2, w_l7_12, w_l7_22, b_l7_2, out_neuron_l7_2, enable, clock, reset
);

wire signed [31:0] out_neuron_l7_3;
neuron_2input_pipelined neuron_l7_3 (
    out_neuron_l6_1, out_neuron_l6_2, w_l7_13, w_l7_23, b_l7_3, out_neuron_l7_3, enable, clock, reset
);

wire signed [31:0] out_neuron_l7_4;
neuron_2input_pipelined neuron_l7_4 (
    out_neuron_l6_1, out_neuron_l6_2, w_l7_14, w_l7_24, b_l7_4, out_neuron_l7_4, enable, clock, reset
);

// LAYER 8
wire signed [31:0] out_neuron_l8_1;
neuron_4input_pipelined neuron_l8_1 (
    out_neuron_l7_1, out_neuron_l7_2, out_neuron_l7_3, out_neuron_l7_4, w_l8_11, w_l8_21, w_l8_31, w_l8_41, b_l8_1, out_neuron_l8_1, enable, clock, reset
);

wire signed [31:0] out_neuron_l8_2;
neuron_4input_pipelined neuron_l8_2 (
    out_neuron_l7_1, out_neuron_l7_2, out_neuron_l7_3, out_neuron_l7_4, w_l8_12, w_l8_22, w_l8_32, w_l8_42, b_l8_2, out_neuron_l8_2, enable, clock, reset
);

wire signed [31:0] out_neuron_l8_3;
neuron_4input_pipelined neuron_l8_3 (
    out_neuron_l7_1, out_neuron_l7_2, out_neuron_l7_3, out_neuron_l7_4, w_l8_13, w_l8_23, w_l8_33, w_l8_43, b_l8_3, out_neuron_l8_3, enable, clock, reset
);

wire signed [31:0] out_neuron_l8_4;
neuron_4input_pipelined neuron_l8_4 (
    out_neuron_l7_1, out_neuron_l7_2, out_neuron_l7_3, out_neuron_l7_4, w_l8_14, w_l8_24, w_l8_34, w_l8_44, b_l8_4, out_neuron_l8_4, enable, clock, reset
);

// ASSIGN LAYER 8 OUTPUT TO OUTPUT
assign f1 = out_neuron_l8_1;
assign f2 = out_neuron_l8_2;
assign f3 = out_neuron_l8_3;
assign f4 = out_neuron_l8_4;

endmodule