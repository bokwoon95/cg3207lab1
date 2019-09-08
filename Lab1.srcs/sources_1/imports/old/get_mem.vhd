-- This module should contain the corresponding Memory data generated from Hex2ROM
-- and choose the memory data to be displayed based on enable signal  
-- Fill in the blank to complete this module 
-- (c) Rajesh Panicker, ECE, NUS

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity get_mem is
  -- fundamental clock 100mhz
  -- enable signal to read the next content
  -- 32 bits memory contents for 7-segments display
  -- 1-bit signal rerequied for leds, indicating which half of the memory data is displaying on leds
  port ( 
    clk : in std_logic;
    enable : in std_logic;
    data : out std_logic_vector(31 downto 0);
    upper_lower : out std_logic
    );
end get_mem;

architecture behavioral of get_mem is
  -- declare address for instr_mem and data_const_mem
  signal addr : std_logic_vector(8 downto 0) := (others => '0');

  -- declare instr_mem and data_const_mem
  type mem_128x32 is array (0 to 127) of std_logic_vector (31 downto 0);
  constant instr_mem : mem_128x32 := (
    x"e59f11f8",
    x"e59f21f8",
    x"e59f3200",
    x"e5924000",
    x"e5814000",
    x"e2533001",
    x"1afffffd",
    x"e59f31ec",
    x"eafffffe",
    others => x"00000000"
  );
  constant data_const_mem : mem_128x32 := (
    x"00000c00",
    x"00000c04",
    x"00000c08",
    x"00000c0c",
    x"00000004",
    x"00000800",
    x"abcd1234",
    x"6c6c6548",
    x"6f57206f",
    x"21646c72",
    x"00212121",
    others => x"00000000"
  );

----------------------------------------------------------------
-- instruction memory
----------------------------------------------------------------









----------------------------------------------------------------
-- data (constant) memory
----------------------------------------------------------------









begin

  -- determine upper_lower by corresponding input


  -- determine corresponding memory data that should be displayed on 7-segments



  -- determine memory index "addr" accordingly
  process(clk)
  begin





  end process;

end behavioral;
