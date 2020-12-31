module Up_Counter_4_Bit(Clock, Resetn, Q, TEN);

input  Clock, Resetn; 
output [3:0] Q;
output TEN;

reg [3:0] Q;
reg TEN;

always @(posedge Clock or negedge Resetn)
begin
	if (Resetn == 0)
	begin
		Q <= 4'b 0000;
		TEN <= 'b 0;
	end
	
	else 
	begin
		Q <= Q + 1;
		if (Q == 4'b 1010)
			TEN <= 'b 1;
		else 
			TEN <= 'b 0;
	end 
end 

endmodule 
