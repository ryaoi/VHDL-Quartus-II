LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_aff IS
PORT(

              ai                     :   IN std_logic_vector( 3 DOWNTO 0);
              bi                     :   IN std_logic_vector( 3 DOWNTO 0);
              canal                  :   IN std_logic;
              ena_reg                :   IN std_logic;
              clk                    :   IN std_logic;
              a, b, c, d, e, f, g    :   OUT std_logic;
              bin                    :   OUT std_logic_vector( 3 DOWNTO 0)

    );
END reg_aff;

ARCHITECTURE rtl1 OF reg_aff IS

  SIGNAL mux_out : std_logic_vector( 3 DOWNTO 0);
  SIGNAL reg     : std_logic_vector( 3 DOWNTO 0);

  COMPONENT bin2seven IS
  PORT(
       bin                 :   IN std_logic_vector( 3 DOWNTO 0);
       a, b, c, d, e, f, g :  OUT std_logic

     );
  END COMPONENT;

BEGIN 

    mux_out <= ai WHEN canal = '1' ELSE
               bi;

  PROCESS(clk, ena_reg)
  BEGIN 
    IF ena_reg = '1' THEN
      IF rising_edge(clk) THEN
        reg <= mux_out;
      END IF;
    END IF;
  END PROCESS;

  bin <= mux_out;

u1 : bin2seven PORT MAP (bin => reg,
                         a   => a,
                         b   => b,
                         c   => c,
                         d   => d,
                         e   => e,
                         f   => f,
                         g   => g);

END rtl1;


