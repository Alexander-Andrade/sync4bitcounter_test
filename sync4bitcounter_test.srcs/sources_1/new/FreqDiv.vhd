library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TTrigger is
    Port (
        c : in std_logic;
        q : out std_logic
    );
end TTrigger;

architecture Behavorial of TTrigger is
    signal tmp_q : std_logic := '0';
begin
    process (c) begin
        if rising_edge(c) then
            tmp_q <= not tmp_q;
        end if;
    end process;
    
    q <= tmp_q;
end Behavorial;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FreqDiv is
    Generic (DIVIDER : integer);
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end FreqDiv;

architecture Behavioral of FreqDiv is
    signal intermediate_clk : std_logic_vector(0 to DIVIDER);
begin
    intermediate_clk(0) <= clk_in;
    clk_out <= intermediate_clk(DIVIDER);

    triggers: for i in 0 to (DIVIDER-1) generate
        trigger : entity work.TTrigger port map (
            c => intermediate_clk(i),
            q => intermediate_clk(i+1)
        );
    end generate triggers;

end Behavioral;
