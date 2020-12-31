module Mux_to_Mux(a, b, c, d, e, f, g,
		  s0, s1, Sel, y);
					
input a, b, c, d, e, f, g;
input s0, s1;
input [1:0] Sel;
output y;

reg y; 
reg Mux_1_Out;

always @(s1 or s0 or a or b or c or d) 
begin
	case({s1, s0})
		2'd0 : Mux_1_Out = a;
		2'd1 : Mux_1_Out = b;
		2'd2 : Mux_1_Out = c; 
		2'd3 : Mux_1_Out = d;
		default : $display("Invalid Control Signals"); 
	endcase
end 

always @(Sel or e or f or g or Mux_1_Out) 
begin
	case({Sel[1], Sel[0]})
		2'd0 : y = Mux_1_Out;
		2'd1 : y = e;
		2'd2 : y = f; 
		2'd3 : y = g;
		default : $display("Invalid Control Signals");
	endcase
end

endmodule









