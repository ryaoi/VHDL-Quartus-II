LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bin2seven_eco IS
PORT (
      bin                 : IN std_logic_vector(3 DOWNTO 0);
      leds_on             : IN std_logic;
      a, b, c, d, e, f, g : OUT std_logic
      );
END bin2seven_eco;

ARCHITECTURE rtl OF bin2seven_eco IS

  SIGNAL out_int : std_logic_vector (6 DOWNTO 0);

BEGIN
          
  a <= out_int(6);
  b <= out_int(5);
  c <= out_int(4);
  d <= out_int(3);
  e <= out_int(2);
  f <= out_int(1);
  g <= out_int(0);
  
  out_int <= "1111111" WHEN leds_on ='1' ELSE
             "0000001" WHEN bin="0000" ELSE
             "1001111" WHEN bin="0001" ELSE
             "0010010" WHEN bin="0010" ELSE
             "0000110" WHEN bin="0011" ELSE
             "1001100" WHEN bin="0100" ELSE
             "0100100" WHEN bin="0101" ELSE
             "0100000" WHEN bin="0110" ELSE
             "0001111" WHEN bin="0111" ELSE
             "0000000" WHEN bin="1000" ELSE
             "0000100" WHEN bin="1001" ELSE
             "0001000" WHEN bin="1010" ELSE
             "1100000" WHEN bin="1011" ELSE
             "1110010" WHEN bin="1100" ELSE
             "1000010" WHEN bin="1101" ELSE
             "0110000" WHEN bin="1110" ELSE
             "0111000" WHEN bin="1111" ELSE
             "1111111";
END rtl;
      