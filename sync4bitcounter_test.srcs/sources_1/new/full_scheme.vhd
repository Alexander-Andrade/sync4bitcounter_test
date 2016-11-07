library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_scheme is
    Port (not_oe, ent, enp, not_sclr, not_sload, clk, not_aclr, not_aload, a, b, c, d : in std_logic;
          cco, rco, q_a, q_b, q_c, q_d : out std_logic; iw_y : out std_logic_vector(27 downto 0));
end full_scheme;

architecture Behavioral of full_scheme is
    component scheme_1 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7 : in std_logic;
              y0 : out std_logic);
    end component;
    
    component scheme_2 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9 : in std_logic;
              y0 : out std_logic);
    end component;
    
    component scheme_3 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11 : in std_logic;
              y0 : out std_logic);
    end component;
    
    component scheme_4 is
        Port (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13: in std_logic;
              y0 : out std_logic);
    end component;
    
    component scheme_5 is
        Port (x0,x1,x2,x3,x4 : in std_logic;
              y0, y1 : out std_logic);
    end component;
    
    component scheme_6 is
        Port (x0,x1,x2,x3 : in std_logic;
              y0, y1, y2 : out std_logic);
    end component;
    
    component scheme_7 is
        Port (x0,x1,x2,x3,x4,x5,x6 : in std_logic;
              y0, y1 : out std_logic);
    end component;
    
    component tri_state_buffer is
        Port (x,c : in std_logic;
              y : out std_logic);
    end component;
    
    component JK_trigger is
        Port (j,k, clk, not_s, not_r : in std_logic;
              q, not_q : out std_logic);
    end component;
    
    signal high : std_logic := '1';
    signal iw : std_logic_vector(27 downto 0) := (others=> '0');
    signal j_inv : std_logic_vector(4 downto 1) := (others=>'0');
begin
    iw_y <= iw;
    iw(0) <= not not_oe;
    scheme_6_1 : scheme_6 port map(x0=>ent,x1=>enp,x2=>not_sclr,x3=>not_sload,y0=>iw(1),y1=>iw(2),y2=>iw(3));
    --iw(1)<='1';
    --iw(2)<='1';
    --iw(3)<='0';
    
    iw(4) <= not clk;
    iw(5) <= not not_aclr;
    iw(6) <= not not_aload;
    
    scheme_1_1 : scheme_1 port map(x0=>a,x1=>iw(3),x2=>iw(2),x3=>iw(12),x4=>iw(1),x5=>iw(1),x6=>iw(2),x7=>iw(12),y0=>iw(7));
    scheme_2_1 : scheme_2 port map(x0=>b,x1=>iw(3),x2=>iw(1),x3=>iw(12),x4=>iw(14),x5=>iw(2),x6=>iw(1),x7=>iw(12),x8=>iw(2),x9=>iw(14),y0=>iw(8));
    scheme_3_1 : scheme_3 port map(x0=>c,x1=>iw(3),x2=>iw(1),x3=>iw(14),x4=>iw(12),x5=>iw(16),x6=>iw(2),x7=>iw(1),x8=>iw(14),x9=>iw(12),x10=>iw(2),x11=>iw(16),y0=>iw(9));
    scheme_4_1 : scheme_4 port map(x0=>d,x1=>iw(3),x2=>iw(1),x3=>iw(16),x4=>iw(14),x5=>iw(12),x6=>iw(18),x7=>iw(2),x8=>iw(1),x9=>iw(16),x10=>iw(14),x11=>iw(12),x12=>iw(2),x13=>iw(18),y0=>iw(10));
    
    scheme_7_1 : scheme_7 port map(x0=>ent,x1=>enp,x2=>iw(4),x3=>iw(18),x4=>iw(16),x5=>iw(14),x6=>iw(12),y0=>cco,y1=>rco);
    scheme_5_1 : scheme_5 port map(x0=>iw(5),x1=>iw(6),x2=>a,x3=>iw(6),x4=>not_aclr,y0=>iw(20),y1=>iw(21));
    scheme_5_2 : scheme_5 port map(x0=>iw(5),x1=>iw(6),x2=>b,x3=>iw(6),x4=>not_aclr,y0=>iw(22),y1=>iw(23));
    scheme_5_3 : scheme_5 port map(x0=>iw(5),x1=>iw(6),x2=>c,x3=>iw(6),x4=>not_aclr,y0=>iw(24),y1=>iw(25));
    scheme_5_4 : scheme_5 port map(x0=>iw(5),x1=>iw(6),x2=>d,x3=>iw(6),x4=>not_aclr,y0=>iw(26),y1=>iw(27));
    
    j_inv(1) <= not iw(7);
    
    jk_trigger_1 : JK_trigger port map(j=>iw(7),k=>j_inv(1),clk=>clk,not_s=>iw(21),not_r=>iw(20),q=>iw(12),not_q=>iw(13));
    j_inv(2) <= not iw(8);
    jk_trigger_2 : JK_trigger port map(j=>iw(8),k=>j_inv(2),clk=>clk,not_s=>iw(23),not_r=>iw(22),q=>iw(14),not_q=>iw(15));
    j_inv(3) <= not iw(9);
    jk_trigger_3 : JK_trigger port map(j=>iw(9),k=>j_inv(3),clk=>clk,not_s=>iw(25),not_r=>iw(24),q=>iw(16),not_q=>iw(17));
    j_inv(4) <= not iw(10);
    jk_trigger_4 : JK_trigger port map(j=>iw(10),k=>j_inv(4),clk=>clk,not_s=>iw(27),not_r=>iw(26),q=>iw(18),not_q=>iw(19));
    
    tri_state_buffer_1 : tri_state_buffer port map(x=>iw(13),c=>iw(0),y=>q_a);
    tri_state_buffer_2 : tri_state_buffer port map(x=>iw(15),c=>iw(0),y=>q_b);
    tri_state_buffer_3 : tri_state_buffer port map(x=>iw(17),c=>iw(0),y=>q_c);
    tri_state_buffer_4 : tri_state_buffer port map(x=>iw(19),c=>iw(0),y=>q_d);
    
end Behavioral;
