library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy is
    port
    (
        -- entradas
        reset : in std_logic;
        clk : in std_logic;
        x : in std_logic;
        -- salida
        led : out std_logic;
Ea : out std_logic;
Eb : out std_logic;
Ec : out std_logic;
Ed : out std_logic;
Ee : out std_logic
    );
end entity;

architecture behavorial of mealy is
   type state is (A,B,C,D,E);   -- tipo de dato numerico
   signal pr_state, nx_state : state; -- signal para manejar los estados siguientes y actuales
signal clk_aux : STD_LOGIC;
signal contador : integer range 0 to 75000000 := 0;

begin

    -- logica secuencial de estado siguientes

    process (clk_aux, reset)
    begin
        if reset = '1' then -- se activa con el reset en alto y manda pr_state a el estado del reset
            pr_state <= A;
        elsif (rising_edge(clk_aux)) then
            pr_state <= nx_state;
        end if;
    end process;
    process(pr_state, x)
    begin
Ea <= '0';
Eb <= '0';
Ec <= '0';
Ed <= '0';
Ee <= '0';
        case pr_state is
            when A =>
							Ea <= '1';
                if x = '1' then
                    led <= '0';
                    nx_state <= B;
                else
                    led <= '0';
                    nx_state <= A;
                end if;
            when B =>
							Eb <= '1';
                if x = '1' then
                    led <= '0';
                    nx_state <= C;
                else
                    led <= '0';
                    nx_state <= A;
                end if;
            when C =>
							Ec <= '1';
                if x = '1' then
                    led <= '0';
                    nx_state <= C;
                else
                    led <= '0';
                    nx_state <= D;
                end if;    
            when D =>
							Ed <= '1';
                if x = '1' then
                    led <= '1';
                    nx_state <= E;
                else
                    led <= '0';
                    nx_state <= A;
                end if;
            when E =>
							Ee <= '1';
                if x = '1' then
                    led <= '1';
                    nx_state <= B;
                else
                    led <= '0';
                    nx_state <= A;
                end if;
        end case;
    end process;
end behavorial;