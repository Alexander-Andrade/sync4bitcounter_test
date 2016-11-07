library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity scheme_4 is
    Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13: in std_logic;
          y0 : out std_logic);
end scheme_4;

architecture Behavioral of scheme_4 is
    signal wire_0 : std_logic := '0';
    signal wire_1 : std_logic := '0';
begin
    wire_0 <= not (x2 and x3 and x4 and x5);
    wire_1 <= not (x12 and x13);
    y0 <= ((x0 and x1) or (wire_0 and x6 and x7) or (x8 and x9 and x10 and x11 and wire_1));
end Behavioral;
