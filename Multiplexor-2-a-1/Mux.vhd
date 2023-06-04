library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           x : in  STD_LOGIC;
           y : out  STD_LOGIC);
end Mux;

architecture Behavioral of Mux is

signal s1, s2, s3: std_logic; -- Declaración de señales

begin -- Declarar comportamiento

s1 <= not x;
s2 <= a and s1;
s3 <= b and x;

y <= s2 or s3;

end Behavioral;

