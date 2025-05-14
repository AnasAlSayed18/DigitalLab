module SIMCOMP121 (clock, PC, IR, MBR, AC, MAR);
input clock;
output PC, IR, MBR, AC, MAR;
reg [15:0] IR, MBR, AC;
reg [11:0] PC, MAR;
reg [15:0] Memory [0:63];
reg [2:0] state;
parameter load = 4'b0011, store=4'b1011, add=4'b0111 , sub=4'b1000,jmp=4'b1001;


initial begin

	// program
	Memory [10]= 16'h3020;
	Memory [11]= 16'h7021;
	Memory [12]= 16'hB014;
	Memory [13]= 16'h8021;
	Memory [14]= 16'h900A;
	
	
	// data at byte addres
	Memory [32]=16'd7;
	Memory [33]=16'd5;

	//set the program counter to the start of 
	PC =10; state = 0;
	
end

always @(posedge clock) begin

case (state)

0: begin
   MAR <= PC;
   state=1;
   end
	
1:  begin // fetch the instruction from mem
	IR <= Memory[MAR];
	PC <= PC + 1;
	state=2; //next state
	end

2:  begin //Instruction decode
	MAR <=IR[11:0];
	state= 3;
	end

3:  begin // Operand fetch
	state=4;
	case (IR[15:12])
	load : MBR <= Memory[MAR] ;
	add : MBR <= Memory[MAR] ;
	store: MBR<=AC;
	sub : MBR <= Memory[MAR];
	jmp : PC<=MAR;
	endcase
	end

4:  begin //execute
	if (IR[15:12]==4'h7) begin
	AC<= AC+MBR;
	state =0;
	end

	
	else if (IR [15:12] == 4'h3) begin
	AC <= MBR;
	state =0; // next state
	end
	
	else if (IR[15:12] == 4'hB) begin
	Memory[ MAR] <= MBR;
	state = 0;
	end
	else if (IR[15:12]==4'h8)begin
    AC<= AC+(~MBR+1);
    state=0;
    end
    else if (IR[15:12]==4'h9)begin
    state =0;
    end
   end
   endcase
end

endmodule 