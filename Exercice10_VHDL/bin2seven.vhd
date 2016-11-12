LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bin2seven IS
PORT (
      bin : IN std_logic_vector(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT std_logic);
END bin2seven;

ARCHITECTURE rtl OF bin2seven IS
  SIGNAL out_int : std_logic_vector (6 DOWNTO 0);
BEGIN

  a <= out_int(6);
  b <= out_int(5);
  c <= out_int(4);
  d <= out_int(3);
  e <= out_int(2);
  f <= out_int(1);
  g <= out_int(0);

  WITH bin SELECT

  out_int <= "0000001" WHEN "0000",
             "1001111" WHEN "0001",
             "0010010" WHEN "0010",
             "0000110" WHEN "0011",
             "1001100" WHEN "0100",
             "0100100" WHEN "0101",
             "0100000" WHEN "0110",
             "0001111" WHEN "0111",
             "0000000" WHEN "1000",
             "0000100" WHEN "1001",
             "0001000" WHEN "1010",
             "1100000" WHEN "1011",
             "1110010" WHEN "1100",
             "1000010" WHEN "1101",
             "0110000" WHEN "1110",
             "0111000" WHEN OTHERS;

END rtl;
      