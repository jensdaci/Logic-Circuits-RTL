Library IEEE; 
USE IEEE.std_logic_1164.all; 

ENTITY Mux_Demux IS
	PORT(
			I:	    IN	 std_logic_vector(3 downto 0);
			sel_1:  IN   std_logic_vector(1 downto 0);
			sel_2:  IN   std_logic_vector(2 downto 0);
			clk:	IN   std_logic;
			Y:		OUT  std_logic_vector(7 downto 0));
END Mux_Demux;

ARCHITECTURE Mux_Demux_str_arch OF Mux_Demux IS

	COMPONENT DFF IS 
		PORT(
				D:      IN   std_logic; 
				CLOCK:  IN   std_logic;
				Q:      OUT  std_logic);
	END COMPONENT;

	signal A: std_logic; 
	signal M: std_logic_vector(7 downto 0);

	BEGIN

		A <= I(0) WHEN sel_1 = "00" ELSE
			 I(1) WHEN sel_1 = "01" ELSE
			 I(2) WHEN sel_1 = "10" ELSE
			 I(3);
			 
		PROCESS (clk, sel_2)	 
		BEGIN
			IF (clk'event AND clk = '1') THEN
				IF (sel_2 = "000") THEN
					M(0) <= A;
				ELSIF (sel_2 = "001") THEN 
					M(1) <= A; 
				ELSIF (sel_2 = "010") THEN
					M(2) <= A; 
				ELSIF (sel_2 = "011") THEN
					M(3) <= A; 
				ELSIF (sel_2 = "100") THEN
					M(4) <= A;
				ELSIF (sel_2 = "101") THEN
					M(5) <= A ;
				ELSIF (sel_2 = "110") THEN
					M(6) <= A;
				ELSIF (sel_2 = "111") THEN
					M(7) <= A;
				END IF;
			END IF;
		END PROCESS;	

		
		U0: DFF PORT MAP (
							D => M(0),
							CLOCK => clk,
							Q => Y(0)
						  );	
		
		U1: DFF PORT MAP (
							D => M(1),
							CLOCK => clk,
							Q => Y(1)
						  );	
		
		U2: DFF PORT MAP (
							D => M(2),
							CLOCK => clk,
							Q => Y(2)
						  );	
	
		U3: DFF PORT MAP (
							D => M(3),
							CLOCK => clk,
							Q => Y(3)
						  );	
		
		U4: DFF PORT MAP (
							D => M(4),
							CLOCK => clk,
							Q => Y(4)
						  );	
						  
		U5: DFF PORT MAP (
							D => M(5),
							CLOCK => clk,
							Q => Y(5)
						  );	
						  
		U6: DFF PORT MAP (
							D => M(6),
							CLOCK => clk,
							Q => Y(6)
						  );					  
		
		U7: DFF PORT MAP (
							D => M(7),
							CLOCK => clk,
							Q => Y(7)
						  );	
END Mux_Demux_str_arch;


Library IEEE; 
USE IEEE.std_logic_1164.all;

ENTITY DFF IS 
	PORT (	
			D:  	IN  std_logic;
			CLOCK:  IN  std_logic;
			Q:		OUT std_logic);
END DFF; 

ARCHITECTURE dff_arch OF DFF IS 
	BEGIN

		PROCESS(CLOCK)
		BEGIN
			IF (rising_edge(CLOCK)) THEN
				Q <= D;
			END IF;
		END PROCESS;
END dff_arch; 

