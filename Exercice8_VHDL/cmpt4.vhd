LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cmpt4 IS

PORT(
     clk   : IN std_logic;
     ena   : IN std_logic;
     d     : OUT std_logic_vector( 3 DOWNTO 0)
    );

END cmpt4;

ARCHITECTURE rtl OF cmpt4 IS

    SIGNAL d_int : std_logic_vector( 3 DOWNTO 0);

    
BEGIN
   PROCESS(clk,ena)
      BEGIN
        IF ena = '0' THEN
          d_int <= d_int;
        ELSIF rising_edge(clk) THEN
          d_int <= d_int + 1;
        END IF;
    END PROCESS;
  d <= d_int;
END rtl;