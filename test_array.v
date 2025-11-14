module array_ports (
    input  [31:0] data_in,   // Flattened: 4 x 8 bits
    output [31:0] data_out
);
    wire [7:0] in_array [0:3];
    wire [7:0] out_array [0:3];

    assign {in_array[3], in_array[2], in_array[1], in_array[0]} = data_in;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            assign out_array[i] = in_array[i] + 1;
        end
    endgenerate

    assign data_out = {out_array[3], out_array[2], out_array[1], out_array[0]};
endmodule