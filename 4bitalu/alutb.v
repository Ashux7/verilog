`timescale 1ns/1ps

module alu_tb();
    reg [3:0]a,b,opcode,x,y;

    alu4 dut (.a(a),.b(b),.opcode(opcode),.x(x),.y(y));

    x = 4'd0;
    y = 4'd0;

    initial 
    begin
        $monitor("a = %a , B = %b , OP = %opcode , X = %x , Y = %y",a,b,opcode,x,y);
        a = 4'b0000 ; b = 4'b0000 ; opcode = 4'b0000 ; #10;
        a = 4'b0001 ; b = 4'b0001 ; opcode = 4'b0001 ; #10;
        a = 4'b0010 ; b = 4'b0011 ; opcode = 4'b0011 ; #10;
        a = 4'b1111 ; b = 4'b1111 ; opcode = 4'b1110 ; #10;
        $finish
    end

endmodule