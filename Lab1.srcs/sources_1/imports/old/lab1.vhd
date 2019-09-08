-- top level module
-- this project displays the memory contents on both leds (16 bits by 16 bits) and 
-- 7-segments (32 bits by 32 bits) with a frequency chosen by btnu and btnc.   
-- (c) rajesh panicker, ece, nus

library ieee;
use ieee.std_logic_1164.all;


entity lab1 is
-- fundamental clock 1mhz
-- button btnu for 4hz speed
-- button btnc for pause
-- 16 leds to display upper or lower 16 bits of memory data
-- dot point of 7-segments, can be deleted if 7-segments are not implemented
-- anodes of 7-segments, can be deleted if 7-segments are not implemented
-- cathodes of 7-segments, can be deleted if 7-segments are not implemented
  port (
    clk, btnu, btnc : in std_logic;
    led : out std_logic_vector(15 downto 0);
    dp: out std_logic;
    anode : out std_logic_vector(7 downto 0);
    cathode : out std_logic_vector(6 downto 0)
    );
end lab1;

-- enable signal to read the next memory content
-- 1-bit signal used between modules to indicate either upper or lower 16-bit contents is displaying on leds, upper_lower = 1 to display upper half of the memory data
-- entire 32-bit contents displaying on leds and 7-segments, can be deleted if 7-segments are not implemented
architecture behavioral of lab1 is
  signal enable : std_logic := '0';
  signal upper_lower : std_logic := '0';
  signal data : std_logic_vector(31 downto 0);
begin

-- choose 1hz or 4hz display frequency based on btnu and btnc readings, using given module clock_enable.vhd



-- fetch memory content, using given module get_mem.vhd       





-- displays the 32-bit memory data on 7-segments, using given module seven_seg.v
-- this module can be deleted if students do not want to implement the 7-segment display





-- split the 32-bit memory data using a multiplexer to display on led


end behavioral;
