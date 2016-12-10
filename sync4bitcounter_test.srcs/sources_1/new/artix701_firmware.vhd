library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--dip switches:
--not_oe  R8
--ent     P8
--enp     R7



--Push Buttons
--not_aclr  P6
--not_aload R5
--not_sclr  U6
--not_sload U5

--rotary switches ?

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity artix701_firmware is
     Port (not_ent, sclr, sload, clk, clk_n, aclr, aload, a, b, c, d: in std_logic;
         cco, rco, q_a, q_b, q_c, q_d, clk_out: out std_logic);
end artix701_firmware;

architecture Behavioral of artix701_firmware is
     
    signal clk_buffered : std_logic;
    signal clk_main : std_logic;
    signal not_sclr, not_sload, not_aclr, not_aload : std_logic;
    signal not_oe : std_logic := '0';
    signal ent : std_logic;
begin
    
    ibufds0 : ibufds port map (I => clk, IB => clk_n, O => clk_buffered);
    fd : entity work.FreqDiv generic map (DIVIDER=>26)
                              port map (clk_in => clk_buffered, clk_out => clk_main);
    
    clk_out <= clk_main;
    
    ent <= not not_ent;
    not_sclr <= not sclr;
    not_sload <= not sload;
    not_aclr <= not aclr;
    not_aload <= not aload;
    
    
    counter1 : entity work.full_scheme port map(not_oe=>not_oe, ent=>ent, enp=>ent, not_sclr=>not_sclr, not_sload=>not_sload,
                               clk=>clk_main, not_aclr=>not_aclr, not_aload=>not_aload, a=>a, b=>b, c=>c, d=>d,
                               cco=>cco, rco=>rco, q_a=>q_a, q_b=>q_b, q_c=>q_c, q_d=>q_d);
    
end Behavioral;
