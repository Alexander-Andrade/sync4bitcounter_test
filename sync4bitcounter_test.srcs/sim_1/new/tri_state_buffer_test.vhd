library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tri_state_buffer_test is
end tri_state_buffer_test;

architecture Behavioral of tri_state_buffer_test is
    component tri_state_buffer is
        Port (x,c : in std_logic;
              y : out std_logic);
    end component;
    signal x,c : std_logic := '0';
    signal y : std_logic := '0';
begin
    uut : tri_state_buffer port map(x,c,y);
    
    process
    begin
        x<='0';
        c<='1';
        wait for 10 ns;
        x<='1';
        c<='1';
        wait for 10 ns;
        x<='1';
        c<='0';
        wait for 10 ns;
        x<='0';
        c<='0';
        wait for 10 ns;
    end process;
end Behavioral;
