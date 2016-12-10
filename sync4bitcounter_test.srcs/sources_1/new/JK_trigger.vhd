library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--J K Q(t) Q(t+1)
--0	0	0	0
--0	0	1	1
--0	1	0	0
--0	1	1	0
--1	0	0	1
--1	0	1	1
--1	1	0	1
--1	1	1	0

--Таблица истинности JK триггера.
--Входы	Выходы
--S-R	C	J	K	Q	-Q
--0	1	Х	Х	Х	1	0
--1	0	Х	Х	Х	0	1
--0	0	Х	Х	Х	Не определено
--1	1	0?1	1	0	1	0
--1	1	0?1	0	1	0	1
--1	1	0?1	0	0	Не изменяется
--1	1	0?1	1	1	Меняется на противоположное
--1	1	1	Х	Х	Не изменяется
--1	1	0	Х	Х	Не изменяется
--1	1	1?0	Х	Х	Не изменяется


entity JK_trigger is
    Port (j,k, clk, not_s, not_r : in std_logic;
          q, not_q : out std_logic);
end JK_trigger;

architecture Behavioral of JK_trigger is
    signal q_temp : std_logic;
--    attribute keep : string;
--    attribute keep of q_temp : signal is "true";
begin
    process(clk, not_s , not_r) 
    begin
        if (not_s='0') and (not_r='0') then
            q_temp <= 'X';
        elsif (not_s='0') and (not_r='1') then
            q_temp <= '1';
        elsif (not_s='1') and (not_r='0') then
            q_temp <= '0';
        elsif clk'event and clk='1' then 
            if (j='0') and (k='1') then
                q_temp <='0';
            elsif (j='1') and (k='0') then
                q_temp <='1';
            elsif (j='1') and (k='1') then
                q_temp <= not q_temp;
            end if;
        end if;
    end process;
    
    q<= q_temp;
    not_q <= not q_temp;
    
end Behavioral;


--architecture Behavioral of JK_trigger is
--begin
--    process(clk, not_s , not_r)
--    variable result : std_logic := '0';
--    begin
--        if not_r = '0' then
--            result := '0';
--        elsif not_s = '0' then
--            result := '1';
--        elsif rising_edge(clk) then
--            if j = '1' and k = '1' then
--                result := not result;
--            elsif j = '1' then
--                result := '1';
--            elsif k = '1' then
--                result := '0';
--            end if;
--        end if;
        
--        q <= result;
--        not_q <= not result;
        
--    end process;

--end Behavioral;