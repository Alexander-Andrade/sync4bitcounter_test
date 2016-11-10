library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.ALL;
use IEEE.std_logic_textio.ALL;

entity etalon_tofile is
end etalon_tofile;

architecture Behavioral of etalon_tofile is

    component full_scheme
        Port (not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d : in std_logic;
              cco, rco, q_a, q_b, q_c, q_d : out std_logic);
    end component;
    
    file fetalon : text;
    
    signal not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d: std_logic := '0';
    signal cco, rco, q_a, q_b, q_c, q_d : std_logic := '0';
    
    constant clk_period : time := 5 ns;
    constant clk_x2 : time := 10 ns;
    
    procedure state_2file(file fname : text) is
            variable l: line;
    begin
        --in row
        write(l, not_oe);
        write(l, ent);
        write(l, enp);
        write(l, not_sclr);
        write(l, not_sload);
        --write(l, clk);
        write(l, not_aclr);
        write(l, not_aload);
        write(l, a);
        write(l, b);
        write(l, c);
        write(l, d);
        writeline(fname, l);  
        --out row
        write(l, cco);  
        write(l, rco); 
        write(l, q_a); 
        write(l, q_b); 
        write(l, q_c);   
        write(l, q_d);   
        writeline(fname, l);   
    end procedure;     
begin

    uut : full_scheme port map(not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d, cco, rco, q_a, q_b, q_c, q_d);
    process
    begin
       clk <= '0';
       wait for clk_period;
       clk <= '1';
       wait for clk_period;
    end process;
    
    process
    begin
        file_open(fetalon, "../../../etalon.txt", write_mode);
        
        --counting
        not_oe<='0';
        ent<='1';
        enp<='1';
        not_sclr<='1';
        not_sload<='1';
        not_aclr<='1';
        not_aload<='1';
        for i in 0 to 15 loop 
            wait for 5 ns;
            state_2file(fetalon);
        end loop;
        
        --async clear
        not_oe<='0';
        not_aclr<='0';
        wait for 5 ns;
        state_2file(fetalon);
        
        --async load
        a<='0';
        b<='1';
        c<='0';
        d<='1'; 
        
        not_oe<='0';
        not_aclr<='1';
        not_aload<='0';
        wait for 5 ns;
        state_2file(fetalon);
        
        --sync clear
        not_oe<='0';
        not_sclr<='1';
        not_aload<='1';
        not_sclr<='0';
        wait for 5 ns;
        state_2file(fetalon);
        
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
        wait for 5 ns;
        state_2file(fetalon);
        
        --counting
        not_oe<='0';
        ent<='1';
        enp<='1';
        not_sclr<='1';
        not_sload<='1';
        not_aclr<='1';
        not_aload<='1';
        for i in 0 to 4 loop 
           wait for 5 ns;
           state_2file(fetalon);
        end loop;
        
        --inhibit counting
        not_oe<='0';
        ent<='0';
        enp<='1';
        not_sclr<='1';
        not_sload<='1';
        not_aclr<='1';
        not_aload<='1';
        wait for 5 ns;
        state_2file(fetalon);
        
        file_close(fetalon);
        wait;
    end process;    
    
end Behavioral;
