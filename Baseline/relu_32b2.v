module relu_32b2 (a, b);

input [31:0] a;
output [31:0] b;

wire signed [31:0] a;
wire signed [31:0] b;

reg signed [31:0] f;
always @(*) begin
    if (a < 0) begin
      f <= 32'd0;
    end
    else begin
      f <= a;
    end
end

assign b = f;

endmodule