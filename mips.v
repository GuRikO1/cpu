`default_nettype none

module mips(input wire clk, reset,
            output wire [31:0] pc,
            input wire [31:0] instr,
            output wire memwrite,
            output wire [31:0] aluout, writedata,
            input wire [31:0] readdata);

    wire memtoreg, branch, alusrc, regdst, regwrite,
         jump, zero, pcsrc;
    wire [2:0] alucontrol;

    controller c(instr[31:26], instr[5:0], zero,
                 memtoreg, memwrite, pcsrc, alusrc,
                 regdst, regwrite, jump, alucontrol);
    datapath dp(clk, reset, memtoreg, pcsrc, alusrc,
                regdst, regwrite, jump, alucontrol,
                zero, pc, instr, aluout, writedata,
                readdata);

endmodule

`default_nettype wire