module comparator(input [6:0] cData,output reg out);
always @(cData)begin
if(cData==7'b0100100)
out=1'b1;
else
out=1'b0;
end
endmodule
