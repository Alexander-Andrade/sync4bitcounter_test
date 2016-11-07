library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity scheme_5_test is
end scheme_5_test;

architecture Behavioral of scheme_5_test is
    component scheme_5 is
        Port (x0,x1,x2,x3,x4 : in std_logic;
              y0, y1 : out std_logic);
    end component;
    signal x : std_logic_vector(4 downto 0) := ('0','0','0','0','0');
    signal y : std_logic_vector(1 downto 0) := ('0','0');
begin
    uut : scheme_5 port map(x0 => x(0), x1 => x(1), x2 => x(2), x3 => x(3), x4 => x(4), y0 => y(0), y1 => y(1));

--    process
--    begin
--        for i in 0 to 31 loop
--            x <= std_logic_vector(to_unsigned(i, x'length));
--            wait for 10 ns;
--        end loop;
--    end process;
    x(0)<='0';
    x(1)<='0';
    x(2)<='0';
    x(3)<='0';
    x(4)<='1';
end Behavioral;
