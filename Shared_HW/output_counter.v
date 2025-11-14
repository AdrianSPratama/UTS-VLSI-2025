module output_counter (En_o_count, Res_o_count, Clock, o_count_out);

input En_o_count, Res_o_count, Clock;
output [2:0] o_count_out;

wire En_o_count, Res_o_count, Clock;
reg [2:0] o_count_out;

always @(posedge Clock) begin
    if (!Res_o_count) begin
      o_count_out <= 3'd0;
    end
    else begin
      if (En_o_count) begin
        o_count_out <= o_count_out + 1;
      end
      else begin
        o_count_out <= o_count_out;
      end
    end
end

endmodule