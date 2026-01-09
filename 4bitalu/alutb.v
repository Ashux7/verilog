`timescale 1ps/1ps

module alu_tb();
    reg [3:0]a,b,opcode;
    wire [3:0]x,y;

    alu4 dut (.a(a),.b(b),.opcode(opcode),.x(x),.y(y));
    initial 
    begin
        $monitor("a = %b , B = %b , OP = %b, X = %b , Y = %b",a,b,opcode,x,y);
        a = 4'b0000 ; b = 4'b0000 ; opcode = 4'b0000 ; #10;
        a = 4'b0001 ; b = 4'b0001 ; opcode = 4'b0001 ; #10;
        a = 4'b0010 ; b = 4'b0011 ; opcode = 4'b0011 ; #10;
        a = 4'b1111 ; b = 4'b1111 ; opcode = 4'b1110 ; #10;
        a = 4'b1010; b = 4'b1100; opcode = 4'd8; #10; // x=1000
        a = 4'b1010; b = 4'b0101; opcode = 4'd9; #10; // x=1111
        a = 4'b1111; b = 4'b0101; opcode = 4'd10; #10; // x=1010
        // opcode 11: a > b
        a = 4'd5; b = 4'd3; opcode = 4'd11; #10; // x=1
        a = 4'd2; b = 4'd7; opcode = 4'd11; #10; // x=0

// opcode 12: a < b
        a = 4'd1; b = 4'd4; opcode = 4'd12; #10; // x=1

// opcode 13: a == b
        a = 4'd9; b = 4'd9; opcode = 4'd13; #10; // x=1
        a = 4'd9; b = 4'd8; opcode = 4'd13; #10; // x=0
// opcode 5: logical NOT b
        b = 4'b0000; opcode = 4'd5; #10; // x=1
        b = 4'b0010; opcode = 4'd5; #10; // x=0

// opcode 6: bitwise NOT b
        b = 4'b1100; opcode = 4'd6; #10; // x=0011

// opcode 7: reduction AND b
        b = 4'b1111; opcode = 4'd7; #10; // x=1
        b = 4'b1110; opcode = 4'd7; #10; // x=0
// opcode 0: reduction OR
        a = 4'b0000; b = 4'bxxxx; opcode = 4'd0; #10; // x=0
        a = 4'b1010; b = 4'bxxxx; opcode = 4'd0; #10; // x=1

// opcode 1: reduction XOR (parity)
        a = 4'b0000; opcode = 4'd1; #10; // x=0
        a = 4'b1111; opcode = 4'd1; #10; // x=0
        a = 4'b1011; opcode = 4'd1; #10; // x=1

// opcode 2: reduction AND
        a = 4'b1111; opcode = 4'd2; #10; // x=1
        a = 4'b1101; opcode = 4'd2; #10; // x=0

// opcode 3: logical NOT
        a = 4'b0000; opcode = 4'd3; #10; // x=1
        a = 4'b0100; opcode = 4'd3; #10; // x=0

// opcode 4: bitwise NOT
        a = 4'b1010; opcode = 4'd4; #10; // x=0101

        $finish;
    end

endmodule