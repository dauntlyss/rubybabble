# Tests the has_tiles_for method of the TileRack class

require "minitest/autorun"
require_relative "../../tile_rack.rb"
require_relative "../../tile_group.rb"

class TileRack::TestNumberOfTilesNeeded < Minitest::Test
  # Used to setup a new TileRack before each test
  def setup
    @tr = TileRack.new
  end

  # Tests to ensure rack that has all letters needed for word in order will return true
  def test_rack_has_needed_letters_when_letters_are_in_order_no_duplicates
    @tr.append('S')
    @tr.append('W')
    @tr.append('E')
    @tr.append('A')
    @tr.append('T')
    @tr.append('D')
    @tr.append('P')
    assert_equal true, @tr.has_tiles_for?('SWEAT')
  end

  # Tests to ensure rack that has all letters needed for word in not order will return true
  def test_rack_has_needed_letters_when_letters_are_not_in_order_no_duplicates
    @tr.append('T')
    @tr.append('S')
    @tr.append('W')
    @tr.append('E')
    @tr.append('A')
    @tr.append('P')
    @tr.append('D')
    assert_equal true, @tr.has_tiles_for?('SWEAT')
  end

  # Test that false is returned when letters needed to make word are not present
  def test_rack_doesnt_contain_any_needed_letters
    @tr.append('R')
    @tr.append('G')
    @tr.append('H')
    @tr.append('M')
    @tr.append('O')
    @tr.append('I')
    @tr.append('D')
    assert_equal false, @tr.has_tiles_for?('SWEAT')
  end
  # Test that false is returned when ALL letters needed to make word are not present
  def test_rack_contains_some_but_not_all_needed_letters
    @tr.append('R')
    @tr.append('S')
    @tr.append('W')
    @tr.append('E')
    @tr.append('O')
    @tr.append('I')
    @tr.append('D')
    assert_equal false, @tr.has_tiles_for?('SWEAT')
  end

  # Test that true is returned if rack has all letters needed for word plus dups
  def test_rack_contains_a_word_with_duplicate_letters
    @tr.append('T')
    @tr.append('S')
    @tr.append('W')
    @tr.append('E')
    @tr.append('A')
    @tr.append('E')
    @tr.append('E')
    assert_equal true, @tr.has_tiles_for?('SWEET')
  end

  # Test that false is returned if rack does not contain enough duplicate letters to make specified word
  def test_rack_doesnt_contain_enough_duplicate_letters
    @tr.append('T')
    @tr.append('S')
    @tr.append('W')
    @tr.append('E')
    @tr.append('A')
    @tr.append('I')
    @tr.append('O')
    assert_equal false, @tr.has_tiles_for?('SWEET')
  end

end
