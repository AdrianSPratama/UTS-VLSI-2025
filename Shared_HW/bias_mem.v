module bias_mem (En_b_mem, Addr_mem_b, Res, Clock,
                 b_l1_1, b_l1_2, b_l1_3, b_l1_4,
                 b_l2_1, b_l2_2,
                 b_l3_1,
                 b_l4_1,
                 b_l5_1,
                 b_l6_1, b_l6_2,
                 b_l7_1, b_l7_2, b_l7_3, b_l7_4,
                 b_l8_1, b_l8_2, b_l8_3, b_l8_4,
                 mem_out);

input En_b_mem, Res, Clock;
input [4:0] Addr_mem_b;
input [31:0] b_l1_1, b_l1_2, b_l1_3, b_l1_4,
             b_l2_1, b_l2_2,
             b_l3_1,
             b_l4_1,
             b_l5_1,
             b_l6_1, b_l6_2,
             b_l7_1, b_l7_2, b_l7_3, b_l7_4,
             b_l8_1, b_l8_2, b_l8_3, b_l8_4;
output [31:0] mem_out;

wire En_b_mem, Res, Clock;
wire [4:0] Addr_mem_b;
wire signed [31:0] b_l1_1, b_l1_2, b_l1_3, b_l1_4,
                   b_l2_1, b_l2_2,
                   b_l3_1,
                   b_l4_1,
                   b_l5_1,
                   b_l6_1, b_l6_2,
                   b_l7_1, b_l7_2, b_l7_3, b_l7_4,
                   b_l8_1, b_l8_2, b_l8_3, b_l8_4;
wire [31:0] mem_out;

// Register 32 bit sebanyak 19 address
reg [31:0] mem_block [0:18];

integer i;
always @(posedge Clock) begin
    if(!Res) begin
      for (i=0; i<19; i=i+1) begin // Reset semua isi register
        mem_block[i] <= 32'd0;
      end
    end
    else begin
      if (En_b_mem) begin // {input 1, input 2, input 3, input 4}
        mem_block[0] <= b_l1_1; // Layer 1
        mem_block[1] <= b_l1_2;
        mem_block[2] <= b_l1_3;
        mem_block[3] <= b_l1_4;
        mem_block[4] <= b_l2_1; // Layer 2
        mem_block[5] <= b_l2_2;
        mem_block[6] <= b_l3_1; // Layer 3
        mem_block[7] <= b_l4_1; // Layer 4
        mem_block[8] <= b_l5_1; // Layer 5
        mem_block[9] <= b_l6_1; // Layer 6
        mem_block[10] <= b_l6_2; 
        mem_block[11] <= b_l7_1; // Layer 7
        mem_block[12] <= b_l7_2;
        mem_block[13] <= b_l7_3;
        mem_block[14] <= b_l7_4;
        mem_block[15] <= b_l8_1; // Layer 8
        mem_block[16] <= b_l8_2;
        mem_block[17] <= b_l8_3;
        mem_block[18] <= b_l8_4;
      end
      else begin
        mem_block[0] <= mem_block[0]; // Layer 1
        mem_block[1] <= mem_block[1];
        mem_block[2] <= mem_block[2];
        mem_block[3] <= mem_block[3];
        mem_block[4] <= mem_block[4]; // Layer 2
        mem_block[5] <= mem_block[5];
        mem_block[6] <= mem_block[6]; // Layer 3
        mem_block[7] <= mem_block[7]; // Layer 4
        mem_block[8] <= mem_block[8]; // Layer 5
        mem_block[9] <= mem_block[9]; // Layer 6
        mem_block[10] <= mem_block[10]; 
        mem_block[11] <= mem_block[11]; // Layer 7
        mem_block[12] <= mem_block[12];
        mem_block[13] <= mem_block[13];
        mem_block[14] <= mem_block[14];
        mem_block[15] <= mem_block[15]; // Layer 8
        mem_block[16] <= mem_block[16];
        mem_block[17] <= mem_block[17];
        mem_block[18] <= mem_block[18];
      end
    end
end

assign mem_out = mem_block[Addr_mem_b];

endmodule