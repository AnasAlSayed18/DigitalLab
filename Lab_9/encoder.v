module encoder(input i0,i1,i2,i3, output reg [1:0] out);
always @(i0,i1,i2,i3)begin
if(i3==1'b1)
out=2'b11;
else if(i2==1'b1)
out=2'b10;
else if(i1==1'b1)
out=2'b01;
else
out=2'b00;
end 
endmodule
