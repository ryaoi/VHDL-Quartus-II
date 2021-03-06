LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cmpt_bcd IS
  PORT(
        clk       : IN std_logic;
        n_reset   : IN std_logic;
        ena       : IN std_logic;
        d         : OUT std_logic_vector( 3 DOWNTO 0);
        retenue   : OUT std_logic
      );

END cmpt_bcd;

ARCHITECTURE rtl OF cmpt_bcd IS

  SIGNAL d_int : std_logic_vector( 3 DOWNTO 0);
  CONSTANT MAX : integer := 9;
  BEGIN
    PROCESS(clk, n_reset)
    BEGIN
      IF n_reset = '0' THEN
        d_int <= (OTHERS => '0');
      ELSIF rising_edge(clk) THEN
           IF ena = '1' THEN
              IF d_int = MAX THEN
                  d_int <= (OTHERS => '0');
              ELSE  
                  d_int <= d_int + 1;
              END IF;
           ELSE
              d_int <= d_int;
           END IF;
     END IF;
   END PROCESS;

   retenue <= '1' WHEN d_int = MAX ELSE '0';

   d <= d_int;

   END rtl;