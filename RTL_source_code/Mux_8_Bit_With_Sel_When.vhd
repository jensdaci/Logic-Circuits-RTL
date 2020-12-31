Library IEEE; 
USE IEEE.std_logic_1164.all;

ENTITY Mux_8_Bit_With_Sel_When IS
	PORT(
			D:    IN   std_logic_vector(7 downto 0);
			sel:  IN   std_logic_vector(2 downto 0);
			Y:	  OUT  std_logic);
END Mux_8_Bit_With_Sel_When; 

ARCHITECTURE Mux_With_Sel_When_Arch OF Mux_8_Bit_With_Sel_When IS
	BEGIN 

	WITH sel SELECT 
	Y <= D(0) WHEN "000",
		 D(1) WHEN "001",
		 D(2) WHEN "010",
		 D(3) WHEN "011",
		 D(4) WHEN "100",
		 D(5) WHEN "101",
		 D(6) WHEN "110",
		 D(7) WHEN OTHERS;

END Mux_With_Sel_When_Arch; 