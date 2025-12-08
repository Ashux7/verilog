`timescale 1ps/1ps

module F_1;
    reg A,B,C;
    wire Y;
    
    assign Y = (~(~A|B)&C);


    initial begin
        $display("Q1");
        $monitor("A=%b,B=%b,C=%b,Y=%b",A,B,C,Y);

        A = 0 ; B = 0 ; C = 0 ; #10;
        A = 0 ; B = 0 ; C = 1 ; #10;
        A = 0 ; B = 1 ; C = 0 ; #10;
        A = 0 ; B = 1 ; C = 1 ; #10;
        A = 1 ; B = 0 ; C = 0 ; #10;
        A = 1 ; B = 0 ; C = 1 ; #10;
        A = 1 ; B = 1 ; C = 0 ; #10;
        A = 1 ; B = 1 ; C = 1 ; #10;
        
        $finish;
    end;

    initial begin
        $dumpfile("q1.vcd");
        $dumpvars(0,F_1);
    end

endmodule