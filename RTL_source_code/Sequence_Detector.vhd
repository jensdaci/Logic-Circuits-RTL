Library IEEE; 
USE IEEE.std_logic_1164.all; 

ENTITY Sequence_Detector IS
	PORT(
			A, CLK, RST: IN   std_logic; 
			Z: 			 OUT  std_logic);
END Sequence_Detector; 

ARCHITECTURE Detector_Arch of Sequence_Detector IS
	TYPE   state_type is (S0, S1, S2); 
	SIGNAL current_state, next_state: state_type; 

BEGIN 
	
	-- Combinational Logic 
	PROCESS(current_state, A)
	BEGIN
		CASE current_state IS
			WHEN S0 => 
				IF (A = '0') THEN
					Z <= '0';
					next_state <= S0; 
				ELSIF (A = '1') THEN
					Z <= '0'; 
					next_state <= S1; 
				ELSE 
					Z <= 'U'; 
					next_state <= S0;
				END IF; 
				
			WHEN S1 => 
				IF (A = '0') THEN
					Z <= '0';
					next_state <= S2; 
				ELSIF (A = '1') THEN
					Z <= '0'; 
					next_state <= S1; 
				ELSE 
					Z <= 'U'; 
					next_state <= S0;
				END IF;  	
					
			WHEN S2 => 
				IF (A = '0') THEN
					Z <= '1';
					next_state <= S0; 
				ELSIF (A = '1') THEN
					Z <= '0'; 
					next_state <= S1; 
				ELSE 
					Z <= 'U'; 
					next_state <= S0;
				END IF;
		END CASE; 
	END PROCESS; 
	
	-- Synchronous Elements (Asynchronous RST) 
	PROCESS(CLK, RST, next_state)
	BEGIN 
		IF (RST = '1') THEN
			current_state <= S0; 
		ELSIF (CLK'Event and CLK = '1') THEN
			current_state <= next_state; 
		END IF; 
	END PROCESS; 
	
END Detector_Arch; 
					
					
							