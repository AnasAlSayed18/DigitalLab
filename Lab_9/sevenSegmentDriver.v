module sevenSegmentDriver(input [1:0] in,output reg [6:0] out);
always @(in)begin
if(in==2'b00)
out=7'b1000000;
else if(in == 2'b01)
out=7'b1111001;
else if(in==2'b10)
out =7'b0100100;
else
out=7'b0110000;
end
endmodule
