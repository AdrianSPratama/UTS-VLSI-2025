`include "relu_32b2.v"

module neuron_2input_baseline (x1, x2, w1, w2, b, f);

input [31:0] x1, x2, w1, w2, b;
output [31:0] f;

wire signed [31:0] x1, x2, w1, w2, b;
wire signed [31:0] f;

// Tahap pertama
wire signed [31:0] w1x1, w2x2;
assign w1x1 = w1 * x1;
assign w2x2 = w2 * x2;

// Tahap kedua
wire signed [31:0] output_before_bias;
assign output_before_bias = w1x1 + w2x2;

// Tahap ketiga (ditambah bias)
wire signed [31:0] output_bias;
assign output_bias = output_before_bias + b;

// ReLu
wire signed [31:0] output_relu;
relu_32b2 RELU (output_bias, output_relu);
assign f = output_relu;

endmodule