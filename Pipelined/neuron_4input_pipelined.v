`include "relu_32b4.v"

// Reset active low
module neuron_4input_pipelined (x1, x2, x3, x4,
                               w1, w2, w3, w4,
                               b, f, enable, clock, reset);

input enable, clock, reset;
input [31:0] x1, x2, x3, x4, w1, w2, w3, w4, b;
output [31:0] f;

wire enable, clock, reset;
wire signed [31:0] x1, x2, x3, x4, w1, w2, w3, w4, b;
wire signed [31:0] f;

// Tahap pertama
wire signed [31:0] w1x1, w2x2, w3x3, w4x4;
assign w1x1 = w1 * x1;
assign w2x2 = w2 * x2; 
assign w3x3 = w3 * x3; 
assign w4x4 = w4 * x4;

// Pipeline reg
reg signed [31:0] pipe [0:3]; // pipe[0] untuk w1x1, pipe[1] untuk w2x2, dst
always @(posedge clock) begin
    if(!reset) begin
      pipe[0] <= 32'd0;
      pipe[1] <= 32'd0;
      pipe[2] <= 32'd0;
      pipe[3] <= 32'd0;
    end
    else begin
      if (enable) begin
        pipe[0] <= w1x1; // Masukkan output multiplier ke register pipeline
        pipe[1] <= w2x2; // Masukkan output multiplier ke register pipeline
        pipe[2] <= w3x3; // Masukkan output multiplier ke register pipeline
        pipe[3] <= w4x4; // Masukkan output multiplier ke register pipeline
      end
    end
end

// Tahap kedua
wire signed [31:0] output_x1x2, output_x3x4;
assign output_x1x2 = pipe[0] + pipe[1];
assign output_x3x4 = pipe[2] + pipe[3];

// Tahap ketiga
wire signed [31:0] output_before_bias;
assign output_before_bias = output_x1x2 + output_x3x4;

// Tahap keempat
wire signed [31:0] output_bias;
assign output_bias = output_before_bias + b;

// ReLu
wire signed [31:0] output_relu;
relu_32b4 RELU (output_bias, output_relu);
assign f = output_relu;

endmodule