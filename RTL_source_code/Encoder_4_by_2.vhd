Library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Encoder_4_by_2 IS
	PORT(
			D:	IN	 std_logic_vector(3 downto 0);
			Q:	OUT  std_logic_vector(1 downto 0));
END Encoder_4_by_2;

ARCHITECTURE Encoder_Arch OF Encoder_4_by_2 IS 
	BEGIN

	PROCESS(D)
	BEGIN
		CASE D IS
			WHEN "0001" => Q <= "00";
			WHEN "0010" => Q <= "01";
			WHEN "0100" => Q <= "10";
			WHEN "1000" => Q <= "11";
			WHEN OTHERS => Q <= "XX";
		END CASE;
	END PROCESS;
END Encoder_Arch;
	
			