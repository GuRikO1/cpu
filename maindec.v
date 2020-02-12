`default_nettype none

module maindec(input wire [5:0] op,
               output wire memtoreg, memwrite, branch,
                      alusrc, regdst,
               output wire regwrite, jump,
               output wire [1:0] aluop);

    reg [8:0] controls;

    assign {regwrite, regdst, alusrc, branch, memwrite,
            memtoreg, jump, aluop} = controls;

    always @(*)
        case (op)
            6'b00_0000: controls <= 9'b1_1000_0010; //Rtype 
            6'b10_0011: controls <= 9'b1_0100_1000; //lw 
            6'b10_1011: controls <= 9'b0_0101_0000; //sw 
            6'b00_0100: controls <= 9'b0_0010_0001; //beq 
            6'b00_1000: controls <= 9'b1_0100_0000; //addi 
            6'b00_0010: controls <= 9'b0_0000_0100; //j 
            default: controls <= 9'bx_xxxx_xxxx; //??? 
        endcase

endmodule

`default_nettype wire