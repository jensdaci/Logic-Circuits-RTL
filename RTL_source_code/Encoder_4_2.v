module Encoder_4_2(D, Q);
				   
input  [3:0] D;
output [1:0] Q;

reg [1:0] Q; 

always @(D)
begin
	if(D == 4'b 0001)
		Q = 2'b 00; 
	else if (D == 4'b 0010)
		Q = 2'b 01; 
	else if (D == 4'b 0100)
		Q = 2'b 10; 
	else if (D == 4'b 1000)
		Q = 2'b 11; 
	else
		Q = 2'b xx; 
end

endmodule 
