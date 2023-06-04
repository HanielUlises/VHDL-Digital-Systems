library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SumRest is
	port (
		A : in  STD_LOGIC_VECTOR (3 downto 0);
      B : in  STD_LOGIC_VECTOR (3 downto 0);
      Sel : in  STD_LOGIC;
      Salida : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end SumRest;

architecture Behavioral of SumRest is

begin

	Salida <= ( A - B ) when Sel = '1' else ( A + B );

end Behavioral;