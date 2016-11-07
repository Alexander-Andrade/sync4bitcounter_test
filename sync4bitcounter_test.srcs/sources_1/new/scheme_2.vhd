library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity scheme_2 is
    Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9 : in std_logic;
          y0 : out std_logic);
end scheme_2;

architecture Behavioral of scheme_2 is
    signal wire_0 : std_logic := '0';
    signal wire_1 : std_logic := '1';
begin
    wire_0 <= not (x2 and x3);
    wire_1 <= not (x8 and x9);
    y0 <= ((x0 and x1) or (wire_0 and x4 and x5) or (wire_1 and x6 and x7));
end Behavioral;
