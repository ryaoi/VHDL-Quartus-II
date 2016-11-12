LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cmpt_09_aff IS
  PORT(
        clk       : IN std_logic;
        n_reset   : IN std_logic;
        ena       : IN std_logic;
        a         : OUT std_logic;
        b         : OUT std_logic;
        c         : OUT std_logic;
        d         : OUT std_logic;
        e         : OUT std_logic;
        f         : OUT std_logic;
        g         : OUT std_logic
      );
END cmpt_09_aff;

ARCHITECTURE rtl OF cmpt_09_aff IS

  SIGNAL clk_ena      : std_logic;
  SIGNAL d_int        : std_logic_vector( 3 DOWNTO 0);

  COMPONENT gen_ena IS
  PORT(
      clk    				 : IN std_logic;
      sortie_test    : OUT std_logic;
      clk_ena				 : OUT std_logic
      );
END COMPONENT;

  COMPONENT cmpt_bcd IS
  PORT(
        clk       : IN std_logic;
        n_reset   : IN std_logic;
        ena       : IN std_logic;
        d         : OUT std_logic_vector( 3 DOWNTO 0);
        retenue   : OUT std_logic
      );

END COMPONENT;

  COMPONENT bin2seven IS
  PORT (
      bin                 : IN std_logic_vector(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT std_logic
        );
END COMPONENT;

BEGIN

  u1: gen_ena   PORT MAP  ( clk     => clk,
                            clk_ena => clk_ena);

  u2: cmpt_bcd  PORT MAP   ( clk     => clk,
                             ena     => clk_ena,
                             d       => d_int,
                             n_reset => n_reset);

  u3: bin2seven PORT MAP   ( bin => d_int,
                             a   => a,
                             b   => b,
                             c   => c,
                             d   => d,
                             e   => e,
                             f   => f,
                             g   => g);

END rtl;