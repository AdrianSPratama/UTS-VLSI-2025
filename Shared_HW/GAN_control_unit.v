module GAN_control_unit (Reset, Start, Wb_count, Clock,
                         Output);

input Reset, Start, Clock;
input [4:0] Wb_count;
output [9:0] Output;

wire Reset, Start, Clock;
wire [4:0] Wb_count;
reg [9:0] Output;

parameter state_size = 3;
parameter S1 = 3'b000;
parameter S2 = 3'b001;
parameter S3 = 3'b010;
parameter S4 = 3'b011;
parameter S5 = 3'b100;
parameter S6 = 3'b101;
reg [state_size-1:0] state;

// Keterangan urutan sinyal kontrol pada array bit output
// Paling atas berarti MSB, yaitu bit ke 9, paling bawah berarti LSB
// Output                   Posisi bit
// Load_s                   9
// Res_reg_all              8
// En_input_reg             7
// En_w_mem                 6
// En_b_mem                 5
// En_out_mem               4
// En_wb_count              3
// En_o_count               2
// Res_wb_count             1
// Res_o_count              0

// State transition block, arah state 1 ke state lainnya
always @(posedge Clock) begin
    if(!Reset) begin
      state <= S1;
    end
    else begin
      case (state)
      S1: begin
        if (Start) begin
          state <= S2;
        end
        else begin
          state <= S1;
        end
      end
      S2: begin
        state <= S3;
      end
      S3: begin
        state <= S4;
      end
      S4: begin
        case (Wb_count)
            3, 5, 6, 7, 8, 10, 14: begin
              state <= S5;
            end
            18: begin
              state <= S6;
            end
            default: begin
              state <= S4;
            end
        endcase   
      end
      S5: begin
        state <= S4;
      end
      S6: begin
        state <= S6;
      end
      default: begin
        state <= S1;
      end
      endcase
    end
end

// Conditional state block, output dari setiap state (belum dikerjain)
always @(state) begin
    case (state)
      S1: begin
        Output <= 10'b1000000000;
      end
      S2: begin
        Output <= 10'b1111110011;
      end
      S3: begin
        Output <= 10'b0100011111;
      end
      S4: begin
        Output <= 10'b0100011111;
      end
      S5: begin
        Output <= 10'b0110010110;
      end
      S6: begin
        Output <= 10'b0100000011;
      end
      default:
        Output <= 10'b0000000000;
    endcase
end

endmodule