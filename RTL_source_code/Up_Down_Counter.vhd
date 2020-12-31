Library IEEE;
USE IEEE.std_logic_1164.all; 
USE IEEE.std_logic_unsigned.all;

ENTITY Up_Down_Counter IS
	PORT(
			CLK:		  IN   std_logic; 
			RESET, CLEAR: IN   std_logic; 
			UP_DOWN:	  IN   std_logic;
			Q:			  OUT  std_logic_vector(0 to 2));
END Up_Down_Counter; 

ARCHITECTURE Counter_Arch OF Up_Down_Counter IS
	SIGNAL count: std_logic_vector(0 to 2):= "000";
	
BEGIN
	
	PROCESS(CLK, RESET, CLEAR)
	BEGIN
		IF (CLEAR = '1') THEN
			count <= "000";
		ELSIF (CLK'EVENT and CLK = '1') THEN
			IF (RESET = '1') THEN
				count <= "000"; 
			ELSE 
				IF (UP_DOWN = '1') THEN
					count <= count + '1';
				ELSE
					count <= count - '1'; 
				END IF; 
			END IF; 
		END IF; 
	END PROCESS; 
	
	Q <= count; 
	
END Counter_Arch; 
				
	

	 