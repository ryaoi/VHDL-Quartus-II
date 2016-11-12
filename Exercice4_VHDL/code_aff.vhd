LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


Entity code_aff IS

PORT ( 
        req1                        : IN std_logic_vector(3 DOWNTO 1);
        bout                        : OUT std_logic_vector(1 DOWNTO 0);
        a1, b1, c1, d1, e1, f1, g1  : OUT std_logic
      );
END code_aff;

ARCHITECTURE rtl OF code_aff IS

    SIGNAL test         : std_logic_vector(1 DOWNTO 0);
    SIGNAL leds_on_int  : std_logic;

COMPONENT code2bin IS

PORT ( 
        req : IN std_logic_vector(3 DOWNTO 1);
        b   : OUT std_logic_vector(1 DOWNTO 0));
END COMPONENT;


COMPONENT bin2seven_eco IS

PORT (
      bin                 : IN std_logic_vector(3 DOWNTO 0);
      leds_on             : IN std_logic;
      a, b, c, d, e, f, g : OUT std_logic
      );
END COMPONENT;

BEGIN 

    u1: code2bin PORT MAP (
                            req(3) => req1(3),
                            req(2) => req1(2),
                            req(1) => req1(1),
                            b(0) => test(0),
                            b(1) => test(1)
                          );

    u2: bin2seven_eco PORT MAP (
                                  bin(3) => '0',
                                  bin(2) => '0',
                                  bin(1) => test(1),
                                  bin(0) => test(0),
                                  leds_on => leds_on_int,
                                  a => a1,
                                  b => b1,
                                  c => c1,
                                  d => d1 ,
                                  e => e1,
                                  f => f1,
                                  g => g1
                               );

    

    leds_on_int <= test(1) NOR test(0);
    bout(0) <= test(0);
    bout(1) <= test(1);
 

END rtl;