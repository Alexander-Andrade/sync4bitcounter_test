library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity scheme_1_test is
end scheme_1_test;

architecture Behavioral of scheme_1_test is
    component scheme_1 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7 : in std_logic;
              y0 : out std_logic);
    end component;
    signal x : std_logic_vector(7 downto 0) := ('0','0','0','0','0','0','0','0');
    signal y : std_logic := '0';
begin
    uut : scheme_1 port map(x(0),x(1),x(2),x(3),x(4),x(5),x(6),x(7), y);
    
    process 
    begin
        for i in 0 to 255 loop
            x <= std_logic_vector(to_unsigned(i, x'length));
            wait for 10 ns;
        end loop;
    end process;
end Behavioral;
