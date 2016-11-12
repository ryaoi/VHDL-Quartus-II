LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY get_bout IS
PORT(
      bouton           : IN std_logic_vector( 3 DOWNTO 0);
      a,b,c,d,e,f,g    : OUT std_logic
    );
END get_bout

ARCHITECTURE rtl OF get_bout IS

  SIGNAL 