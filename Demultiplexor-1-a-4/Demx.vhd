library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VHDL1 is
    Port ( I, S1, S0 : in  STD_LOGIC;
           O1, O2, O3, O4: out  STD_LOGIC);
end VHDL1;

architecture Behavioral of VHDL1 is

begin
	O1 <= I and(not S0) and(not S1);
	O2 <= I and(not S0) and (S1);
	O3 <= I and(S0)and(not S1);
	O4 <= I and(S0) and(S1);
	
end Behavioral;

