	component ex2b is
		port (
			clk_clk                   : in  std_logic                     := 'X';             -- clk
			reset_reset_n             : in  std_logic                     := 'X';             -- reset_n
			rotary_in_1_rotary_in     : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rotary_in
			rotary_in_2_rotary_in     : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rotary_in
			led_pins_1_led0           : out std_logic_vector(6 downto 0);                     -- led0
			led_pins_1_led1           : out std_logic_vector(6 downto 0);                     -- led1
			led_pins_2_led0           : out std_logic_vector(6 downto 0);                     -- led0
			led_pins_2_led1           : out std_logic_vector(6 downto 0);                     -- led1
			buttons_export            : out std_logic_vector(15 downto 0);                    -- export
			shift_shiftreg_clk        : out std_logic;                                        -- shiftreg_clk
			shift_shiftreg_loadn      : out std_logic;                                        -- shiftreg_loadn
			shift_shiftreg_out        : in  std_logic                     := 'X';             -- shiftreg_out
			rotary_event_1_rotary_cw  : out std_logic;                                        -- rotary_cw
			rotary_event_1_rotary_ccw : out std_logic;                                        -- rotary_ccw
			rotary_event_2_rotary_cw  : out std_logic;                                        -- rotary_cw
			rotary_event_2_rotary_ccw : out std_logic                                         -- rotary_ccw
		);
	end component ex2b;

	u0 : component ex2b
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --            clk.clk
			reset_reset_n             => CONNECTED_TO_reset_reset_n,             --          reset.reset_n
			rotary_in_1_rotary_in     => CONNECTED_TO_rotary_in_1_rotary_in,     --    rotary_in_1.rotary_in
			rotary_in_2_rotary_in     => CONNECTED_TO_rotary_in_2_rotary_in,     --    rotary_in_2.rotary_in
			led_pins_1_led0           => CONNECTED_TO_led_pins_1_led0,           --     led_pins_1.led0
			led_pins_1_led1           => CONNECTED_TO_led_pins_1_led1,           --               .led1
			led_pins_2_led0           => CONNECTED_TO_led_pins_2_led0,           --     led_pins_2.led0
			led_pins_2_led1           => CONNECTED_TO_led_pins_2_led1,           --               .led1
			buttons_export            => CONNECTED_TO_buttons_export,            --        buttons.export
			shift_shiftreg_clk        => CONNECTED_TO_shift_shiftreg_clk,        --          shift.shiftreg_clk
			shift_shiftreg_loadn      => CONNECTED_TO_shift_shiftreg_loadn,      --               .shiftreg_loadn
			shift_shiftreg_out        => CONNECTED_TO_shift_shiftreg_out,        --               .shiftreg_out
			rotary_event_1_rotary_cw  => CONNECTED_TO_rotary_event_1_rotary_cw,  -- rotary_event_1.rotary_cw
			rotary_event_1_rotary_ccw => CONNECTED_TO_rotary_event_1_rotary_ccw, --               .rotary_ccw
			rotary_event_2_rotary_cw  => CONNECTED_TO_rotary_event_2_rotary_cw,  -- rotary_event_2.rotary_cw
			rotary_event_2_rotary_ccw => CONNECTED_TO_rotary_event_2_rotary_ccw  --               .rotary_ccw
		);

