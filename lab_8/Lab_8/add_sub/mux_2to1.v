module mux_2to1( A, B,sel,Y);
input A,B,sel;
output reg  Y;

    always @(*) begin
    if (sel)
        Y = A;
    else
        Y = B;
end
endmodule
