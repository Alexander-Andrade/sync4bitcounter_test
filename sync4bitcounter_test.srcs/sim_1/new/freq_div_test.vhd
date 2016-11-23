library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freq_div_test is
end freq_div_test;

architecture Behavioral of freq_div_test is
    component freq_divider
        Generic(DIV : integer);
        Port ( clk_in : in std_logic;
        clk_out : out std_logic);
    end component;
    
    component FreqDiv
        Generic (DIVIDER : integer);
        Port ( clk_in : in STD_LOGIC;
               clk_out : out STD_LOGIC);
    end component;
    
    signal clk_in : std_logic := '0';
    signal clk_out1 : std_logic := '0';
    signal clk_out2 : std_logic := '0';
begin
    
   uut1 : freq_divider generic map(DIV=>10)
                      port map(clk_in=> clk_in, clk_out=>clk_out1);
   uut2 : FreqDiv generic map(DIVIDER=>10)
                      port map(clk_in=> clk_in, clk_out=>clk_out2);  
    
   process
   begin
          clk_in <= '0';
          wait for 10 ns;
          clk_in <= '1';
          wait for 10 ns;
   end process;
       
end Behavioral;
