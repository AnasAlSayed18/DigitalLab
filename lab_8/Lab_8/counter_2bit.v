//Anas Al Sayed 1221020
module counter_2bit (
    input clk, reset,
    output reg [1:0] Q
);
always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 2'b00;
    else begin
        Q <= Q + 2'b01;
    end
end
endmodule