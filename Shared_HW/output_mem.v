module output_mem (En_out_mem, Addr_mem_o, Res, Clock,
                   in_data, out_data);

input En_out_mem, Res, Clock;
input [2:0] Addr_mem_o;
input [31:0] in_data;
output [127:0] out_data;

wire En_out_mem, Res, Clock;
wire [2:0] Addr_mem_o;
wire [31:0] in_data;
wire [127:0] out_data;

// Register 32 bit sebanyak 4 address
reg [31:0] mem_block [0:3];

integer i;
always @(posedge Clock) begin
    if(!Res) begin
      for (i=0; i<4; i=i+1) begin
        mem_block[i] <= 32'd0;
      end
    end
    else begin
      if (En_out_mem) begin
        mem_block[Addr_mem_o] <= in_data;
      end
      else begin
        mem_block[Addr_mem_o] <= mem_block[Addr_mem_o];
      end
    end
end

assign mem_out = {mem_block[0], mem_block[1], mem_block[2], mem_block[3]};

endmodule