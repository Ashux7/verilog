`timescale 1ns/1ps

module orr;

    reg a , b;
    wire y;

    OR dut (a,b,y);

    initial begin
        $dumpfile("orGate.vcd");
        $dumpvars(0,orr);
    end
    
    initial begin
        $display("OR GATE HEHE");
        $monitor("a = %b , b = %b , y = %b",a,b,y);

        a = 0 ; b = 0 ; #10;
        a = 0 ; b = 1 ; #10;
        a = 1 ; b = 0 ; #10;
        a = 1 ; b = 1 ; #10;

        $finish;
    end


endmodule