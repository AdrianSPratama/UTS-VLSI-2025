`include "relu_32b1.v"

// Reset active low
module neuron_1input_pipelined (x1, w1, b, f, enable, clock, reset);

input enable, clock, reset;
input [31:0] x1, w1, b;
output [31:0] f;

wire enable, clock, reset;
wire signed [31:0] x1, w1, b;
wire signed [31:0] f;

// Tahap pertama
wire signed [31:0] w1x1;
assign w1x1 = w1 * x1;

// Pipeline reg
reg signed [31:0] pipe;
always @(posedge clock) begin
    if(!reset) begin
      pipe <= 32'd0;
    end
    else begin
      if (enable) begin
        pipe <= w1x1; // Masukkan output multiplier ke register pipeline
      end
    end
end

// Tahap kedua (jumlah dengan bias)
wire signed [31:0] output_bias;
assign output_bias = pipe + b;

// ReLu
wire signed [31:0] output_relu;
relu_32b1 RELU (output_bias, output_relu);
assign f = output_relu;

endmodule