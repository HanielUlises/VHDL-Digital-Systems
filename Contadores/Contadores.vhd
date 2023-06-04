library ieee;
use ieee.std_logic_1164.all;

entity Contadores is 
port(
    sel: in std_logic;
    clk: in std_logic;
    reset: in std_logic;
    q: out  std_logic_vector(4 downto 0);
);
end entity  Contadores;

architecture descripcion of Contadores is 
signal ff: std_logic_vector(4 downto 0) :=  "00000"; 
begin
    process(clk, reset,sel)
    begin
        if (rising_edge(clk)) then
            if(sel = '0') then
                --Inicio del contador de tipo Jhonson
                --Reset para inicializar en 0
                if(clr='0')then
                    ff<= "00000";
                else
                    ff(1)<=ff(0);
                    ff(2)<=ff(1);
                    ff(3)<=ff(2);
                    ff(3)<=ff(2);
                    ff(4)<=ff(3);
                    ff(0)<=not(ff(4));
                end if;
            elsif (sel='1')then
                --Inicio del contador de anillo
                --Reset para inicializar desplazamiento
                if(clr='0') then
                    ff<="00001";
                else
                    ff(1)<= ff(0);
                    ff(2)<=ff(1);
                    ff(3)<=ff(2);
                    ff(4)<=ff(3);
                    ff(0)<=ff(4);
                end if;
            end if;
        end if;
    end process;
    Q <= ff;
end architecture descripcion;