library ieee;
use ieee.std_logic_1164.all;

entity contMod10 is
port(
    clk: in std_logic;
    rst: in std_logic;
    sel: in std_logic;
    q:   out std_logic_vector (3 downto 0) 
); 

architecture description of contMod10 is
    signal j0, k0,j1, k1, t2, d3: std_logic;

begin
-- asynchronous variable assignments (shouldn't go into the process, totally combinatorial)
-- each of the flip flop inputs were obtained from their equations

    j0<='1';
    k0<='1';

    j1 < = (not q(0) and q(3) and sel) or (not q(0) and q(2) and sel) or 
        (q(0) and not q(3) and not sel);

    k1 <= ( not q(0) and sel) or 
        (q(0) and not sel);
    
    t2 <= (not q(0) and q(3) and sel) or 
        (not q(0) and not q(1) and q(2) and sel) or 
        (q(0) and q(1) and not sel);

    d3 <= (not q(0) and not q(1) and not q(2) and not q(3) and sel) 
        or (not q(0) and q(3) and not sel) 
        or (q(0) and q(3) and sel) 
        or (q(0) and q(1) and q(2) and not sel);

    process(clk, sel, rst) 
    begin

        
        if (rst = '0') then --Initializing the counter (as this counter is a Moore machine)
            q<='0000';
        elsif (clk'event and clk='1') then

            -- Hardware description of each flip flop
            -- LSB
            if(j0='1' and k0='1') then
                q(0)<=not q(0); 
            end if;         
            
            if (j1 = '0' and k1='0') then
                q(1) <= q(1);
            elsif (j1 = '0' and k1='1') then
                q(1) <= '0';
            elsif (j1 = '1' and k= '1') then
                q(1)<= not q(1);
            elsif (j1 = '1' and k='0') then
                q(1)<= '1';
            end if;     

            if(t2 ='0') then
                q(2)<=q(2);
                
            elsif(t2='1')then
                q(2)<=not q(2);
            end if;

            --MSB
            
            if(d3='1') then
                q(3)<='1';
            else
                q(3)<='0';
            end if;
                
        end if;
    end process;
end description;