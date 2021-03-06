LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cmpt4_50Mhz IS

  PORT (
        clk     : IN std_logic;
        d       : OUT std_logic_vector( 3 DOWNTO 0)
        );

END cmpt4_50Mhz;

ARCHITECTURE rtl OF cmpt4_50Mhz IS
  SIGNAL clk_int : std_logic;

  COMPONENT gen_ena IS
  PORT(
    clk    				 : IN std_logic;
    clk_ena				 : OUT std_logic
    );
  END COMPONENT;

  COMPONENT cmpt4 IS
  PORT(
     clk   : IN std_logic;
     ena   : IN std_logic;
     d     : OUT std_logic_vector( 3 DOWNTO 0)
    );
  END COMPONENT;

BEGIN

  u1: gen_ena PORT MAP (clk     => clk,
                        clk_ena => clk_int);

  u2: cmpt4 PORT MAP   (clk => clk,
                        ena => clk_int,
                        d   => d);

END rtl;