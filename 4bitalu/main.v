module alu4 (
    input [3:0]a,b,opcode;
    output [3:0]x,y 
);
    always@(*) begin
        case (opcode)
            4'd0: x =|a; //redundant OR a
            4'd1: x = ^a;
            4'd2: x = &a;
            4'd3: x = !a;
            4'd4: x = ~a;
            4'd5: x = !b;
            4'd6: x = ~b;
            4'd7: x = &b;
            4'd8: x = a&b;
            4'd9: x = a | b;
            4'd10: x = a ^ b;
            4'd11: x = a>b;
            4'd12: x = a<b;
            4'd13: x = a==b;
            4'd14: {y,x} = a+b;
            4'd15: {y,x} = a-b;
            default: {y,x} = {b,a};
        endcase

    end
endmodule