//Data Flow Modelling
module decoder2to4_df (
    input  wire [1:0] in,
    input  wire       en,
    output wire [3:0] out
);

assign out[0] = en & ~in[1] & ~in[0];
assign out[1] = en & ~in[1] &  in[0];
assign out[2] = en &  in[1] & ~in[0];
assign out[3] = en &  in[1] &  in[0];

endmodule

//Behavioural Modelling
module decoder2to4_beh (
    input  wire [1:0] in,
    input  wire       en,
    output reg  [3:0] out
);

always @(*) begin
    if (en) begin
        case (in)
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
        endcase
    end else begin
        out = 4'b0000;
    end
end

endmodule
