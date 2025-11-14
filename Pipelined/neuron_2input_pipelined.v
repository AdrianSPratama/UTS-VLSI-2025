`include "relu_32b2.v"

// Reset active low
module neuron_2input_pipelined (x1, x2, w1, w2, b, f, enable, clock, reset);

input enable, clock, reset;
input [31:0] x1, x2, w1, w2, b;
output [31:0] f;

wire enable, clock, reset;
wire signed [31:0] x1, x2, w1, w2, b;
wire signed [31:0] f;

// Tahap pertama
wire signed [31:0] w1x1, w2x2;
assign w1x1 = w1 * x1;
assign w2x2 = w2 * x2;

// Pipeline reg
reg signed [31:0] pipe [0:1]; // pipe[0] untuk w1x1, pipe[1] untuk w2x2
always @(posedge clock) begin
    if(!reset) begin
      pipe[0] <= 32'd0;
      pipe[1] <= 32'd0;
    end
    else begin
      if (enable) begin
        pipe[0] <= w1x1; // Masukkan output multiplier ke register pipeline
        pipe[1] <= w2x2; // Masukkan output multiplier ke register pipeline
      end
    end
end

// Tahap kedua
wire signed [31:0] output_before_bias;
assign output_before_bias = pipe[0] + pipe[1];

// Tahap ketiga (ditambah bias)
wire signed [31:0] output_bias;
assign output_bias = output_before_bias + b;

// ReLu
wire signed [31:0] output_relu;
relu_32b2 RELU (output_bias, output_relu);
assign f = output_relu;

endmodule