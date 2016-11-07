library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity scheme_3_test is
end scheme_3_test;

architecture Behavioral of scheme_3_test is
    component scheme_3 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11 : in std_logic;
              y0 : out std_logic);
    end component;
    
    signal x : std_logic_vector(11 downto 0) := ('0','0','0','0','0','0','0','0','0','0','0','0'); 
    signal y : std_logic := '0';
begin
    uut : scheme_3 port map(x(0),x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10),x(11),y);
    
    process
    begin
        x <= (11 downto 5 => '1',
              4 downto 1 => '0',
              0 => '1',
              others => '0');

        if y = '0' then
            report "scheme 2: y must be '1'"
            severity error;
        end if;
        wait for 10 ns;
    end process;
end Behavioral;
