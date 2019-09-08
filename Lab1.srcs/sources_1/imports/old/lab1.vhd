-- top level module
-- this project displays the memory contents on both leds (16 bits by 16 bits) and 
-- 7-segments (32 bits by 32 bits) with a frequency chosen by btnu and btnc.   
-- (c) rajesh panicker, ece, nus

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab1 is
  port (
    clk : in std_logic; -- fundamental clock 100mhz
    btnu : in std_logic; -- button btnu for 4hz speed
    btnc : in std_logic; -- button btnc for pause
    led : out std_logic_vector(15 downto 0); -- 16 leds to display upper or lower 16 bits of memory data
    dp: out std_logic; -- dot point of 7-segments, can be deleted if 7-segments are not implemented
    anode : out std_logic_vector(7 downto 0); -- anodes of 7-segments, can be deleted if 7-segments are not implemented
    cathode : out std_logic_vector(6 downto 0) -- cathodes of 7-segments, can be deleted if 7-segments are not implemented
  );
end lab1;

architecture behavioral of lab1 is
  component clock_enable
    port (
      clk : in std_logic;
      btnU : in std_logic;
      btnC : in std_logic;
      enable : out std_logic
    );
  end component;

  component get_mem
    port (
      clk : in std_logic; -- fundamental clock 100mhz
      enable : in std_logic; -- enable signal to read the next content
      data : out std_logic_vector(31 downto 0); -- 32 bits memory contents for 7-segments display
      upper_lower : out std_logic -- 1-bit signal rerequied for leds, indicating which half of the memory data is displaying on leds
    );
  end component;

  signal enable : std_logic := '0'; -- enable signal to read the next memory content
  signal upper_lower : std_logic := '0'; -- 1-bit signal used between modules to indicate either upper or lower 16-bit contents is displaying on leds, upper_lower = 1 to display upper half of the memory data
  signal data : std_logic_vector(31 downto 0); -- entire 32-bit contents displaying on leds and 7-segments, can be deleted if 7-segments are not implemented
begin
  -- choose 1hz or 4hz display frequency based on btnu and btnc readings, using given module clock_enable.vhd
  clock_enable_0 : clock_enable port map (clk, btnU, btnC, enable);

  -- fetch memory content, using given module get_mem.vhd       
  get_mem_0 : get_mem port map (clk, enable, data, upper_lower);

-- displays the 32-bit memory data on 7-segments, using given module seven_seg.v
-- this module can be deleted if students do not want to implement the 7-segment display

-- split the 32-bit memory data using a multiplexer to display on led
  process(clk)
  begin
    if upper_lower = '0' then
      led <= data(31 downto 16);
    else
      led <= data(15 downto 0);
    end if;
  end process;
end behavioral;
