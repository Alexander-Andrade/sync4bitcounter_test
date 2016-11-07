library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity scheme_6_test is
end scheme_6_test;

architecture Behavioral of scheme_6_test is
    component scheme_6 is
        Port (x0,x1,x2,x3 : in std_logic;
              y0, y1, y2 : out std_logic);
    end component;
    signal x : std_logic_vector(3 downto 0) := (others=>'0');
    signal y : std_logic_vector(2 downto 0) := (others=>'0');
begin
    uut : scheme_6 port map(x0 => x(0), x1 => x(1), x2 => x(2), x3 => x(3), y0 => y(0), y1 => y(1), y2 => y(2));

    process
    begin
        for i in 0 to 15 loop
            x <= std_logic_vector(to_unsigned(i, x'length));
            wait for 10 ns;
        end loop;
    end process;
--    x(0)<='1';
--    x(1)<='1';
--    x(2)<='1';
--    x(3)<='1';
end Behavioral;
