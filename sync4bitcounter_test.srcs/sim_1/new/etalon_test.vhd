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

    uut : full_scheme port map(not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d, cco, rco, q_a, q_b, q_c, q_d);
    
    process
    begin
           clk <= '0';
           wait for clk_period;
           clk <= '1';
           wait for clk_period;
    end process;
    
    
    process
    variable cco_etal, rco_etal, q_a_etal, q_b_etal, q_c_etal, q_d_etal : std_logic := '0'; 
    
    procedure state_fromfile(file fname : text) is
              variable l: line;
              variable temp_vec : std_logic_vector(10 downto 0) := (others=>'0');
            begin
                --in row
                readline(fname, l); 
                read(l, temp_vec);
                
                not_oe <= temp_vec(10);
                ent    <= temp_vec(9);
                enp    <= temp_vec(8);            
                not_sclr <= temp_vec(7);
                not_sload <= temp_vec(6);
                --clk <= temp_vec(5);
                not_aclr <= temp_vec(5);
                not_aload <= temp_vec(4);
                a <= temp_vec(3);  
                b <= temp_vec(2);          
                c <= temp_vec(1);
                d <= temp_vec(0);
       
                --out row
                readline(fname, l); 
                
                read(l, cco_etal);
                read(l, rco_etal);
                read(l, q_a_etal);
                read(l, q_b_etal);
                read(l, q_c_etal);
                read(l, q_d_etal);         
            end procedure;
            
      procedure assertion is
            
      begin
                assert cco_etal = cco 
                report "cco fails" severity error;
                assert rco_etal = rco
                report "rco fails" severity error; 
                assert q_a_etal = q_a
                report "q_a fails" severity error;
                assert q_b_etal = q_b
                report "q_b fails" severity error;
                assert q_c_etal = q_c
                report "q_c fails" severity error;
                assert q_d_etal = q_d
                report "q_d fails" severity error;
      end procedure;
    begin
        file_open(fetalon, "../../../etalon.txt", read_mode);
        
        while not endfile(fetalon) loop
            state_fromfile(fetalon);
            wait for 5 ns;
            assertion;
        end loop;
        
        file_close(fetalon);
        wait;
    end process;
end Behavioral;
