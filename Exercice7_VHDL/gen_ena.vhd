LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY gen_ena IS
PORT(
    clk    				 : IN std_logic;
    sortie_test    : OUT std_logic;
    clk_ena				 : OUT std_logic
    );
END gen_ena;

ARCHITECTURE rtl OF gen_ena IS

  SIGNAL cmpt         : std_logic_vector( 25 DOWNTO 0);
  SIGNAL T            : std_logic;
  constant period     : integer := 50000000;


  BEGIN
    PROCESS(clk)
    BEGIN
      IF rising_edge(clk) THEN
        IF cmpt = period  THEN
          clk_ena <= '1';
          T <= NOT T;
          cmpt <= "00000000000000000000000000";
        ELSE
          clk_ena <= '0';
          cmpt <= cmpt + 1;
        END IF;
      END IF;
    END PROCESS;
  sortie_test <= T;
  END rtl;