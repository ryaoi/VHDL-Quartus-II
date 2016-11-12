LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Entity code2bin IS
PORT ( req : IN std_logic_vector(3 DOWNTO 1);
       b   : OUT std_logic_vector(1 DOWNTO 0));
END code2bin;

ARCHITECTURE rtl OF code2bin IS
BEGIN

--assigniation conditonnelle
    b <= "11" WHEN req(3) = '0' ELSE
         "10" WHEN req(2) = '0' ELSE
         "01" WHEN req(1) = '0' ELSE
         "00";

END rtl;