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

ARCHITECTURE rtl OF reg_aff IS

  SIGNAL reg_aff_1 : std_logic_vector( 3 DOWNTO 0);
  SIGNAL reg_aff_2 : std_logic_vector( 3 DOWNTO 0);

COMPONENT bin2seven IS
PORT(
      
             bin                     :   IN std_logic_vector( 3 DOWNTO 0);
            a, b, c, d, e, f, g      :  OUT std_logic

     );

END COMPONENT;

BEGIN 

    reg_aff_1 <= ai WHEN canal = '1' ELSE
                 bi;

  PROCESS(clk, ena_reg)
  BEGIN 
    IF ena_reg = '0' THEN
        reg_aff_2 <= reg_aff_2;
    ELSIF rising_edge(clk) THEN
        reg_aff_2 <= reg_aff_1;
    END IF;
  END PROCESS;

bin <= reg_aff_1;

u1 : bin2seven PORT MAP ( bin(0) =>  reg_aff_2(0),
                          bin(1) =>  reg_aff_2(1),
                          bin(2) =>  reg_aff_2(2),
                          bin(3) =>  reg_aff_2(3),
                          a => a,
                          b => b,
                          c => c,
                          d => d,
                          e => e,
                          f => f,
                          g => g);

END rtl;


