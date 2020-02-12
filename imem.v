`default_nettype none

module imem(input wire [5:0] a,
            output wire [31:0] rd);

    reg [31:0] RAM[63:0];
    
    initial begin
        $readmemh("memfile.dat", RAM);
    end

    assign rd = RAM[a];

endmodule

`default_nettype wire