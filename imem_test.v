`default_nettype none

module imem_test();
    reg [5:0] a;
    wire [31:0] rd;

    imem im(a, rd);

    initial begin
        a <= 6'd0;
    end

    always begin
        #10 $monitor("rd=%h", rd);
        $finish;
    end

endmodule

`default_nettype wire