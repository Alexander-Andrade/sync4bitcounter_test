library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity scheme_1 is
    Port (x0,x1,x2,x3,x4,x5,x6,x7 : in std_logic;
          y0 :out std_logic);
end scheme_1;

architecture Behavioral of scheme_1 is
    signal wire_0 : std_logic := '0';
begin
    wire_0 <= not(x6 and x7);
    y0 <= ( (x0 and x1) or (x2 and x3 and (not x4)) or (x5 and wire_0));
end Behavioral;
