Library IEEE; 
Use IEEE.std_logic_1164.all; 

ENTITY ClassExample IS
	PORT(
			A, B, CLOCK, RESETN, ENABLE:  IN std_logic; 
			sel: IN   std_logic_vector(1 downto 0);
			Z:   OUT  std_logic);
END ClassExample;

ARCHITECTURE Class_Example_Arch OF ClassExample IS
	Signal Serial_In:  std_logic;	
	Signal Serial_Out: std_logic;
	Signal DFF_1_Out:  std_logic;   
	Signal DFF_2_Out:  std_logic;
	Signal Mux_Out:    std_logic;
	Signal Q: std_logic_vector(7 downto 0);  
	
	BEGIN 
		
		-- First D Flip Flop (Asynchronous)
		PROCESS(RESETN, CLOCK)
		BEGIN
			IF(RESETN = '0') THEN
				DFF_1_Out <= '0';
			ELSIF(CLOCK'Event AND CLOCK = '1') THEN
				DFF_1_Out <= A; 
			END IF; 
		END PROCESS; 
		
		-- Second D Flip Flop (Asynchronous)
		PROCESS(RESETN, CLOCK)
		BEGIN
			IF(RESETN = '0') THEN
				DFF_2_Out <= '0';
			ELSIF(CLOCK'Event AND CLOCK = '1') THEN
				DFF_2_Out <= B; 
			END IF; 
		END PROCESS; 
		
		-- Multiplexer Configuration
		PROCESS(sel, Serial_Out, DFF_1_Out, DFF_2_Out)
		BEGIN
			IF(sel = "00") THEN
				Mux_Out <= Serial_Out; 
			ELSIF(sel = "01") THEN
				Mux_Out <= DFF_1_Out; 
			ELSIF(sel = "10") THEN
				Mux_Out <= DFF_2_Out; 
			END IF; 
			Serial_In <= Mux_Out;
		END PROCESS;  
		
		-- 8-Bit Shift Register
		PROCESS(CLOCK, ENABLE, Q)
		BEGIN
			IF(CLOCK'Event AND CLOCK = '1') THEN
				IF(ENABLE = '1') THEN
					Q(6 downto 0) <= Q(7 downto 1); 
					Q(7) <= Serial_In;
				END IF; 
			END IF; 
			Serial_Out <= Q(0);
		END PROCESS; 
		
		Z <= Serial_Out; 
		
END Class_Example_Arch; 
		

