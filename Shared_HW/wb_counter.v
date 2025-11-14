module wb_counter (En_wb_count, Res_wb_count, Clock, wb_count_out);

input En_wb_count, Res_wb_count, Clock;
output [4:0] wb_count_out;

wire En_wb_count, Res_wb_count, Clock;
reg [4:0] wb_count_out;

always @(posedge Clock) begin
    if (!Res_wb_count) begin
      wb_count_out <= 5'd0;
    end
    else begin
      if (En_wb_count) begin
        wb_count_out <= wb_count_out + 1;
      end
      else begin
        wb_count_out <= wb_count_out;
      end
    end
end

endmodule