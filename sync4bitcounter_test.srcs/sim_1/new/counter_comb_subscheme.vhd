library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_comb_subscheme is
end counter_comb_subscheme;

architecture Behavioral of counter_comb_subscheme is
    component scheme_1 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7 : in std_logic;
              y0 : out std_logic);
    end component;
    component scheme_2 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9 : in std_logic;
              y0 : out std_logic);
    end component;
    component scheme_3 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11 : in std_logic;
              y0 : out std_logic);
    end component;
    component scheme_4 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13: in std_logic;
              y0 : out std_logic);
    end component;
    signal y6 : std_logic_vector(3 downto 1) := ("011");
    signal dy : std_logic_vector(4 downto 1) := (others=>'0');
    signal y : std_logic_vector(4 downto 1) := (others=>'0');
begin
     scheme_1_1 : scheme_1 port map(x0=>'0',x1=>y6(3),x2=>y6(2),x3=>dy(1),x4=>y6(1),x5=>y6(1),x6=>y6(2),x7=>dy(1),y0=>y(1));
     scheme_2_1 : scheme_2 port map(x0=>'0',x1=>y6(3),x2=>y6(1),x3=>dy(1),x4=>dy(2),x5=>y6(2),x6=>y6(1),x7=>dy(1),x8=>y6(2),x9=>dy(2),y0=>y(2));
     scheme_3_1 : scheme_3 port map(x0=>'0',x1=>y6(3),x2=>y6(1),x3=>dy(2),x4=>dy(1),x5=>dy(3),x6=>y6(2),x7=>y6(1),x8=>dy(2),x9=>dy(1),x10=>y6(2),x11=>dy(3),y0=>y(3));
     scheme_4_1 : scheme_4 port map(x0=>'0',x1=>y6(3),x2=>y6(1),x3=>dy(3),x4=>dy(2),x5=>dy(1),x6=>dy(4),x7=>y6(2),x8=>y6(1),x9=>dy(3),x10=>dy(2),x11=>dy(1),x12=>y6(2),x13=>dy(4),y0=>y(4));
    process 
    begin
     for i in 0 to 15 loop
              dy <= std_logic_vector(to_unsigned(i, dy'length));
              wait for 10 ns;
          end loop;
    end process;
end Behavioral;
