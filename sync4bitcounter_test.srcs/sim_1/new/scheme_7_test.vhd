library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity scheme_7_test is
end scheme_7_test;

architecture Behavioral of scheme_7_test is
    component scheme_7 is
        Port (x0,x1,x2,x3,x4,x5,x6 : in std_logic;
              y0, y1 : out std_logic);
    end component;
    
    signal x : std_logic_vector(6 downto 0) := ('0','0','0','0','0','0','0');
    signal y : std_logic_vector(1 downto 0) := ('0','0');
begin
    uut : scheme_7 port map (x(0),x(0),x(0),x(0),x(0),x(0),x(0),y(0),y(1));
    
    process 
    begin
     x <= (6 downto 5 => '1',
                    4 downto 1 => '0',
                    0 => '1',
                    others => '0');
      
              if y(0) = '0' or y(1) = '1' then
                  report "scheme 2: y must be '1'"
                  severity error;
              end if;
      wait for 10 ns;    
    end process;
end Behavioral;
