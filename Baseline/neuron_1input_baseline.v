`include "relu_32b1.v"

module neuron_1input_baseline (x1, w1, b, f);

input [31:0] x1, w1, b;
output [31:0] f;

wire signed [31:0] x1, w1, b;
wire signed [31:0] f;

// Tahap pertama
wire signed [31:0] w1x1;
assign w1x1 = w1 * x1;

// Tahap kedua (jumlah dengan bias)
wire signed [31:0] output_bias;
assign output_bias = w1x1 + b;

// ReLu
wire signed [31:0] output_relu;
relu_32b1 RELU (output_bias, output_relu);
assign f = output_relu;

endmodule