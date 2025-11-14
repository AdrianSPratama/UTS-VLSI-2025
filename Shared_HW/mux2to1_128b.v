module mux2to1_128b (a0, b1, s, out);

parameter bitsize = 128;

input [bitsize-1:0] a0, b1;
input s;
output [bitsize-1:0] out;

wire unsigned [bitsize-1:0] a0, b1;
wire s;
reg unsigned [bitsize-1:0] out;

always @(*)
begin
    if (s == 1'b0) begin
      out <= a0;
    end
    else begin
      out <= b1;
    end
end

endmodule