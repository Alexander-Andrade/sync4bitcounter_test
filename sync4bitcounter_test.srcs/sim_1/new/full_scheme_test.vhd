library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_scheme_test is
end full_scheme_test;

architecture Behavioral of full_scheme_test is
    component full_scheme is
        Port (not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d : in std_logic;
              cco, rco, q_a, q_b, q_c, q_d : out std_logic; iw_y : out std_logic_vector(27 downto 0));
    end component;
    
    signal not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d: std_logic := '0';
    signal cco, rco, q_a, q_b, q_c, q_d : std_logic := '0';
    
    signal iw_y : std_logic_vector(27 downto 0) := (others=>'0');
    
    constant clk_period : time := 5 ns;
    constant clk_x2 : time := 10 ns;
begin
   uut : full_scheme port map(not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d, cco, rco, q_a, q_b, q_c, q_d, iw_y);
   process
   begin
       clk <= '0';
       wait for clk_period;
       clk <= '1';
       wait for clk_period;
   end process;
   
   process
   begin
   --counting
       not_oe<='0';
       ent<='1';
       enp<='1';
       not_sclr<='1';
       not_sload<='1';
       not_aclr<='1';
       not_aload<='1';
       wait for 93 ns;
   --async clear
       not_oe<='0';
       not_aclr<='0';
       wait for 100 ns;
   --async load
       a<='0';
       b<='1';
       c<='0';
       d<='1'; 
   
       not_oe<='0';
       not_aclr<='1';
       not_aload<='0';
       wait for 100 ns; 
   --sync clear
       not_oe<='0';
       not_sclr<='1';
       not_aload<='1';
       not_sclr<='0';
       wait for 100 ns;
   -- sync load
       a<='1';
       b<='1';
       c<='0';
       d<='0'; 
    
       not_oe<='0';
       not_aclr<='1';
       not_aload<='1';
       not_sclr<='1';
       not_sload<='0';
       wait for 100 ns;
     --counting
      not_oe<='0';
      ent<='1';
      enp<='1';
      not_sclr<='1';
      not_sload<='1';
      not_aclr<='1';
      not_aload<='1';
      wait for 100 ns;
     --inhibit counting
      not_oe<='0';
      ent<='0';
      enp<='1';
      not_sclr<='1';
      not_sload<='1';
      not_aclr<='1';
      not_aload<='1';
      wait for 100 ns;
   end process;
         
end Behavioral;
