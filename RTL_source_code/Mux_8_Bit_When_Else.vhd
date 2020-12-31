Library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Mux_8_Bit_When_Else IS
	PORT(
			D: 	  IN   std_logic_vector(7 downto 0);
			sel:  IN   std_logic_vector(2 downto 0);
			Y:	  OUT  std_logic);	
END Mux_8_Bit_When_Else;

ARCHITECTURE Mux_When_Else_Arch OF Mux_8_Bit_When_Else IS
	BEGIN
	
	Y <= D(0) WHEN sel = "000" ELSE
		 D(1) WHEN sel = "001" ELSE
		 D(2) WHEN sel = "010" ELSE
		 D(3) WHEN sel = "011" ELSE
		 D(4) WHEN sel = "100" ELSE
		 D(5) WHEN sel = "101" ELSE
		 D(6) WHEN sel = "110" ELSE
		 D(7);
		 
END Mux_When_Else_Arch;