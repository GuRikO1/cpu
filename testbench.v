`default_nettype none

module testbench();
    reg clk, reset;
    wire [31:0] writedata, dataadr;
    wire memwrite;

    top dut(clk, reset, writedata, dataadr, memwrite);

    initial begin
        reset <= 1; #22; reset <= 0;
    end

    always begin
        clk <= 1; #5; clk <= 0; #5;
    end

    always @(negedge clk) begin
        if (dut.mips.instr !== 32'bx) begin
            // pcbranchが不定値にずっとなっている
            $monitor("instr=%h, signimm=%h, signimmsh=%h, reg[4]=%d", dut.mips.instr, dut.mips.dp.signimm, dut.mips.dp.signimmsh, dut.mips.dp.rf.rf[4]);
        end
        if (memwrite) begin
           if (dataadr === 84 & writedata ==7) begin
               $display("Simulation succeeded");
               $stop;
           end else if (dataadr !== 80) begin
               $display("Simulation failed");
               $stop;
           end
        end
    end

endmodule

`default_nettype wire