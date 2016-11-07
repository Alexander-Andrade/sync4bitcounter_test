library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity scheme_7 is
    Port (x0,x1,x2,x3,x4,x5,x6 : in std_logic;
          y0, y1 : out std_logic);
end scheme_7;

architecture Behavioral of scheme_7 is
    signal wire_0 : std_logic := '0';
    signal wire_1 : std_logic := '0';
    signal wire_2 : std_logic := '0';
begin
    wire_0 <= not(x0 and x1);
    wire_1 <= not x2;
    wire_2 <= (x0 and x3 and x4 and x5 and x6 );
    y0 <= ( (not wire_0) and (not wire_1) and wire_2);
    y1 <= wire_2;
end Behavioral;
