library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.all; --for bandwidth calculation 

use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freq_divider is
    Generic(DIV : integer);
    Port ( clk_in : in std_logic;
           clk_out : out std_logic);
end freq_divider;

architecture Behavioral of freq_divider is
    signal count : integer := 0;
    signal tmp : std_logic := '1';
begin
    process(clk_in)
    begin
    if clk_in'event and clk_in = '1' then
        if count= DIV-1 then
            count <= 0;
            tmp <= not tmp;
        else 
            count <= count+1;
        end if;
    end if;
    end process;
    clk_out <= tmp;
end Behavioral;
