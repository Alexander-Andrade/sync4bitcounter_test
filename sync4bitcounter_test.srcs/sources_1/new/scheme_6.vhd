library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity scheme_6 is
    Port (x0,x1,x2,x3 : in std_logic;
          y0, y1, y2 : out std_logic);
end scheme_6;

architecture Behavioral of scheme_6 is
    signal wire_0 : std_logic := '0';
    signal wire_1 : std_logic := '0';
begin
    wire_0 <= ((x0 and x1 and x3)); 
    wire_1 <= x2;
    
    y0 <= (wire_0) and (wire_1);
    y1 <= x3 and (wire_1);
    y2 <= (not x3) and (wire_1);
end Behavioral;
