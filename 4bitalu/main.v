module alu4 (
    input [3:0]a,b,opcode,
    output reg [3:0]x,y
);
    always @(*) begin
    x = 4'b0000;   // default
    y = 4'b0000;   // default

    case (opcode)
        4'd0:  x = {3'b000, |a};
        4'd1:  x = {3'b000, ^a};
        4'd2:  x = {3'b000, &a};
        4'd3:  x = {3'b000, !a};
        4'd4:  x = ~a;
        4'd5:  x = {3'b000, !b};
        4'd6:  x = ~b;
        4'd7:  x = {3'b000, &b};
        4'd8:  x = a & b;
        4'd9:  x = a | b;
        4'd10: x = a ^ b;
        4'd11: x = {3'b000, a > b};
        4'd12: x = {3'b000, a < b};
        4'd13: x = {3'b000, a == b};
        4'd14: {y, x} = a + b;
        4'd15: {y, x} = a - b;
    endcase
end
endmodule