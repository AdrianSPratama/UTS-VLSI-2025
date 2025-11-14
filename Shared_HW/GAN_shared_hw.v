`include "neuron_4input_baseline.v"
`include "mux2to1_128b.v"
`include "weight_mem.v"
`include "bias_mem.v"
`include "output_mem.v"
`include "wb_counter.v"
`include "output_counter.v"
`include "GAN_control_unit.v"

module GAN_shared_hw (x1, x2, x3, x4,
                     w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44, b_l1_1, b_l1_2, b_l1_3, b_l1_4,
                     w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42, b_l2_1, b_l2_2,
                     w_l3_11, w_l3_21, b_l3_1,
                     w_l4_11, b_l4_1,
                     w_l5_11, b_l5_1,
                     w_l6_11, w_l6_12, b_l6_1, b_l6_2,
                     w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24, b_l7_1, b_l7_2, b_l7_3, b_l7_4,
                     w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44, b_l8_1, b_l8_2, b_l8_3, b_l8_4,
                     f1, f2, f3, f4, Start, Reset, Clock);

input Start, Reset, Clock;
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

wire Start, Reset, Clock;
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

// Instantiate FSM control unit
wire [9:0] control_signals;
GAN_control_unit CONTROL (
    .Reset(Reset),
    .Start(Start),
    .Clock(Clock),
    .Wb_count(wb_count_out),
    .Output(control_signals)
);

// Instantiate WB Counter
wire [4:0] wb_count_out;
wb_counter WB_COUNT (
    .En_wb_count(control_signals[3]),
    .Res_wb_count(control_signals[1]),
    .Clock(Clock),
    .wb_count_out(wb_count_out)
);

// Instantiate Output Counter
wire [2:0] o_count_out;
output_counter OUTPUT_COUNTER (
    .En_o_count(control_signals[2]),
    .Res_o_count(control_signals[0]),
    .Clock(Clock),
    .o_count_out(o_count_out)
);

// Concatenate input
wire signed [31:0] x1_concat, x2_concat, x3_concat, x4_concat;
assign x1_concat = x1;
assign x2_concat = x2;
assign x3_concat = x3;
assign x4_concat = x4;
// Concate menjadi 128 bit untuk input ke neuron
wire signed [127:0] input_concat;
assign input_concat = {x1_concat, x2_concat, x3_concat, x4_concat};

// MUX 128 bit untuk load input
wire [127:0] mux_out;
mux2to1_128b mux_input (
    .a0(output_mem_out),
    .b1(input_concat),
    .s(control_signals[9]), // Load_s
    .out(mux_out)
);

// Register 128 bit INPUT REG
reg [127:0] input_reg;
always @(posedge Clock) begin
    if(!control_signals[8]) begin // Res_reg_all
      input_reg <= 128'd0;
    end
    else begin
      if (control_signals[7]) begin // En_input_reg
        input_reg <= mux_out;
      end
      else begin
        input_reg <= input_reg;
      end
    end
end

// Instantiate Weight memory
wire [127:0] weight_mem_out;
weight_mem WEIGHT_MEM (
    .En_w_mem(control_signals[6]),
    .Addr_mem_w(wb_count_out),
    .Res(control_signals[8]),
    .Clock(Clock),
    .w_l1_11(w_l1_11), .w_l1_12(w_l1_12), .w_l1_13(w_l1_13), .w_l1_14(w_l1_14), .w_l1_21(w_l1_21), .w_l1_22(w_l1_22), .w_l1_23(w_l1_23), .w_l1_24(w_l1_24), .w_l1_31(w_l1_31), .w_l1_32(w_l1_32), .w_l1_33(w_l1_33), .w_l1_34(w_l1_34), .w_l1_41(w_l1_41), .w_l1_42(w_l1_42), .w_l1_43(w_l1_43), .w_l1_44(w_l1_44),
    .w_l2_11(w_l2_11), .w_l2_12(w_l2_12), .w_l2_21(w_l2_21), .w_l2_22(w_l2_22), .w_l2_31(w_l2_31), .w_l2_32(w_l2_32), .w_l2_41(w_l2_41), .w_l2_42(w_l2_42),
    .w_l3_11(w_l3_11), .w_l3_21(w_l3_21),
    .w_l4_11(w_l4_11),
    .w_l5_11(w_l5_11),
    .w_l6_11(w_l6_11), .w_l6_12(w_l6_12),
    .w_l7_11(w_l7_11), .w_l7_12(w_l7_12), .w_l7_13(w_l7_13), .w_l7_14(w_l7_14), .w_l7_21(w_l7_21), .w_l7_22(w_l7_22), .w_l7_23(w_l7_23), .w_l7_24(w_l7_24),
    .w_l8_11(w_l8_11), .w_l8_12(w_l8_12), .w_l8_13(w_l8_13), .w_l8_14(w_l8_14), .w_l8_21(w_l8_21), .w_l8_22(w_l8_22), .w_l8_23(w_l8_23), .w_l8_24(w_l8_24), .w_l8_31(w_l8_31), .w_l8_32(w_l8_32), .w_l8_33(w_l8_33), .w_l8_34(w_l8_34), .w_l8_41(w_l8_41), .w_l8_42(w_l8_42), .w_l8_43(w_l8_43), .w_l8_44(w_l8_44),
    .mem_out(weight_mem_out)
);

// Instantiate bias mem
wire [31:0] bias_mem_out;
bias_mem BIAS_MEM (
    .En_b_mem(control_signals[5]),
    .Addr_mem_b(wb_count_out),
    .Res(control_signals[8]),
    .Clock(Clock),
    .b_l1_1(b_l1_1), .b_l1_2(b_l1_2), .b_l1_3(b_l1_3), .b_l1_4(b_l1_4),
    .b_l2_1(b_l2_1), .b_l2_2(b_l2_2),
    .b_l3_1(b_l3_1),
    .b_l4_1(b_l4_1),
    .b_l5_1(b_l5_1),
    .b_l6_1(b_l6_1), .b_l6_2(b_l6_2),
    .b_l7_1(b_l7_1), .b_l7_2(b_l7_2), .b_l7_3(b_l7_3), .b_l7_4(b_l7_4),
    .b_l8_1(b_l8_1), .b_l8_2(b_l8_2), .b_l8_3(b_l8_3), .b_l8_4(b_l8_4),
    .mem_out(bias_mem_out)
);

// Instantiate output mem
wire [127:0] output_mem_out;
output_mem OUTPUT_MEM(
    .En_out_mem(control_signals[4]),
    .Addr_mem_o(o_count_out),
    .Res(control_signals[8]),
    .Clock(Clock),
    .in_data(neuron_out),
    .out_data(output_mem_out)
);

// Instantiate Neuron
wire signed [31:0] neuron_out;
neuron_4input_baseline NEURON (
    .x1(input_reg[127:96]),
    .x2(input_reg[95:64]),
    .x3(input_reg[63:32]),
    .x4(input_reg[31:0]),
    .w1(weight_mem_out[127:96]),
    .w2(weight_mem_out[95:64]),
    .w3(weight_mem_out[63:32]),
    .w4(weight_mem_out[31:0]),
    .b(bias_mem_out),
    .f(neuron_out)
);

// Assign output ke port output
assign f1 = output_mem_out[127:96];
assign f2 = output_mem_out[95:64];
assign f3 = output_mem_out[63:32];
assign f4 = output_mem_out[31:0];

endmodule