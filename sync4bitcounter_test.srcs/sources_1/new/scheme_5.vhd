library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity scheme_5 is
    Port (x0,x1,x2,x3,x4 : in std_logic;
          y0, y1 : out std_logic);
end scheme_5;

architecture Behavioral of scheme_5 is
    signal wire_0 : std_logic := '0'; 
    signal wire_1 : std_logic := '0'; 
begin
    wire_0 <= x1 and wire_1;
    wire_1 <= not (x2 and x3 and x4);
    y0 <= not (x0 or wire_0);
    y1 <= wire_1;
end Behavioral;
