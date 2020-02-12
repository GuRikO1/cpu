`default_nettype none

module alu(input wire [31:0] srca, srcb,
           input wire [2:0] alucontrol,
           output reg [31:0] aluout,
           output wire zero);

    wire [31:0] srcbd, srcab;

    always @(*) begin
        case (alucontrol[1:0])
            2'b00: aluout <= srca & srcbd; // and
            2'b01: aluout <= srca | srcbd; // or
            2'b10: aluout <= srcab; // add
            2'b11: aluout <= {31'b0, srcab[31]}; // slt
            default: aluout <= 32'hxxxxx;
        endcase
    end

    assign zero = (aluout === 32'b0) ? 1'b1 : 1'b0;
    assign srcbd = (alucontrol[2] == 1'b1) ? ~srcb + 1'b1 : srcb;
    assign srcab = srca + srcbd;

endmodule

`default_nettype wire