module weight_mem (En_w_mem, Addr_mem_w, Res, Clock, 
                   w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44,
                   w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42,
                   w_l3_11, w_l3_21,
                   w_l4_11,
                   w_l5_11,
                   w_l6_11, w_l6_12, b_l6_1, b_l6_2,
                   w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24,
                   w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44,
                   mem_out);

input En_w_mem, Res, Clock;
input [4:0] Addr_mem_w;
input [31:0] w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44,
             w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42,
             w_l3_11, w_l3_21,
             w_l4_11,
             w_l5_11,
             w_l6_11, w_l6_12, b_l6_1, b_l6_2,
             w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24,
             w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44;
output [127:0] mem_out;

wire En_w_mem, Res, Clock;
wire [4:0] Addr_mem_w;
wire signed [31:0] w_l1_11, w_l1_12, w_l1_13, w_l1_14, w_l1_21, w_l1_22, w_l1_23, w_l1_24, w_l1_31, w_l1_32, w_l1_33, w_l1_34, w_l1_41, w_l1_42, w_l1_43, w_l1_44,
             w_l2_11, w_l2_12, w_l2_21, w_l2_22, w_l2_31, w_l2_32, w_l2_41, w_l2_42,
             w_l3_11, w_l3_21,
             w_l4_11,
             w_l5_11,
             w_l6_11, w_l6_12, b_l6_1, b_l6_2,
             w_l7_11, w_l7_12, w_l7_13, w_l7_14, w_l7_21, w_l7_22, w_l7_23, w_l7_24,
             w_l8_11, w_l8_12, w_l8_13, w_l8_14, w_l8_21, w_l8_22, w_l8_23, w_l8_24, w_l8_31, w_l8_32, w_l8_33, w_l8_34, w_l8_41, w_l8_42, w_l8_43, w_l8_44;
wire [127:0] mem_out;

// Register 128 bit sebanyak 19 address
reg [127:0] mem_block [0:18];

integer i;
always @(posedge Clock) begin
    if(!Res) begin
      for (i=0; i<19; i=i+1) begin // Reset semua isi register
        mem_block[i] <= 128'd0;
      end
    end
    else begin
      if (En_w_mem) begin // {input 1, input 2, input 3, input 4}
        mem_block[0] <= {w_l1_11, w_l1_21, w_l1_31, w_l1_41}; // Layer 1
        mem_block[1] <= {w_l1_12, w_l1_22, w_l1_32, w_l1_42};
        mem_block[2] <= {w_l1_13, w_l1_23, w_l1_33, w_l1_43};
        mem_block[3] <= {w_l1_14, w_l1_24, w_l1_34, w_l1_44};
        mem_block[4] <= {w_l2_11, w_l2_21, w_l2_31, w_l2_41}; // Layer 2
        mem_block[5] <= {w_l2_12, w_l2_22, w_l2_32, w_l2_42};
        mem_block[6] <= {w_l3_11, w_l3_21, 32'd0, 32'd0}; // Layer 3
        mem_block[7] <= {w_l4_11, 32'd0, 32'd0, 32'd0}; // Layer 4
        mem_block[8] <= {w_l5_11, 32'd0, 32'd0, 32'd0}; // Layer 5
        mem_block[9] <= {w_l6_11, 32'd0, 32'd0, 32'd0}; // Layer 6
        mem_block[10] <= {w_l6_12, 32'd0, 32'd0, 32'd0}; 
        mem_block[11] <= {w_l7_11, w_l7_21, 32'd0, 32'd0}; // Layer 7
        mem_block[12] <= {w_l7_12, w_l7_22, 32'd0, 32'd0};
        mem_block[13] <= {w_l7_13, w_l7_23, 32'd0, 32'd0};
        mem_block[14] <= {w_l7_14, w_l7_24, 32'd0, 32'd0};
        mem_block[15] <= {w_l8_11, w_l8_21, w_l8_31, w_l8_41}; // Layer 8
        mem_block[16] <= {w_l8_12, w_l8_22, w_l8_32, w_l8_42};
        mem_block[17] <= {w_l8_13, w_l8_23, w_l8_33, w_l8_43};
        mem_block[18] <= {w_l8_14, w_l8_24, w_l8_34, w_l8_44};
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

assign mem_out = mem_block[Addr_mem_w];

endmodule