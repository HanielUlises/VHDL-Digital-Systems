library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VHDL1 is
    Port ( A, B, C, D : in  STD_LOGIC;
           W, X, Y, Z : out  STD_LOGIC);
end VHDL1;

architecture Behavioral of VHDL1 is

begin
	process (A, B, C, D)
		begin
		W <= A;
		X <= A xor B;
		Y <= B xor C;
		Z <= C xor D;
	end process;
end Behavioral;

