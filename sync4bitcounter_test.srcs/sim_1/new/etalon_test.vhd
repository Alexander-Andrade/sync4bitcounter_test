library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.ALL;
use IEEE.std_logic_textio.ALL;

entity etalon_test is
end etalon_test;

architecture Behavioral of etalon_test is
    component full_scheme
        Port (not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d : in std_logic;
              cco, rco, q_a, q_b, q_c, q_d : out std_logic);
    end component;
    
    file fetalon : text;
    
    signal not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d: std_logic := '0';
    signal cco, rco, q_a, q_b, q_c, q_d : std_logic := '0';
    
    constant clk_period : time := 5 ns;
    constant clk_x2 : time := 10 ns;
    
    
begin


    process
    procedure state_fromfile(file fname : text) is
              variable l: line;
              variable temp : std_logic := '0';
            begin
                --in row
                readline(fname, l); 
                
                read(l, temp);
                not_oe <= temp;
                
                read(l, temp);
                ent <= temp;
    
                read(l, temp);
                enp <= temp;            
                
                read(l, temp);
                not_sclr <= temp; 
                
                read(l, temp);
                not_sload <= temp;
                
                read(l, temp);
                clk <= temp;
                
                read(l, temp);
                not_aclr <= temp;
                
                read(l, temp);
                not_aload <= temp;
                
                read(l, temp);
                a <= temp;  
                
                read(l, temp);
                b <= temp;          
                
                read(l, temp);
                c <= temp;
                
                read(l, temp);
                d <= temp;
         --cco, rco, q_a, q_b, q_c, q_d       
                --out row
                readline(fname, l); 
                
                read(l, temp);
                cco <= temp;
                
                read(l, temp);
                rco <= temp;
    
                read(l, temp);
                q_a <= temp; 
                
                read(l, temp);
                q_b <= temp;
    
                read(l, temp);
                q_c <= temp;
               
                read(l, temp);
                q_d <= temp;           
            end procedure;
    begin
        file_open(fetalon, "../../../etalon.txt", read_mode);
        state_fromfile(fetalon);
        
        file_close(fetalon);
        wait;
    end process;
end Behavioral;
