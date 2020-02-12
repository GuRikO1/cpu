`default_nettype none

module aludec(input wire [5:0] funct,
              input wire [1:0] aluop,
              output reg [2:0] alucontrol);

    always @(*)
        case (aluop)
            2'b00: alucontrol <= 3'b010; //+
            2'b01: alucontrol <= 3'b110; //-
            default: case (funct) //Rtype
                6'b10_0000: alucontrol <= 3'b010; //add
                6'b10_0010: alucontrol <= 3'b110; //sub
                6'b10_0000: alucontrol <= 3'b010; //
                6'b10_0100: alucontrol <= 3'b000; //and
                6'b10_0101: alucontrol <= 3'b001; //or
                6'b10_1010: alucontrol <= 3'b111; //slt: set less than
                default: alucontrol <= 3'bxxx; //???
            endcase
        endcase

endmodule

`default_nettype wire