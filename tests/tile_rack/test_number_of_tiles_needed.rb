# Tests the number_of_tiles_needed method of the TileRack class

require "minitest/autorun"
require_relative "../../tile_rack.rb"
require_relative "../../tile_group.rb"

class TileRack::TestNumberOfTilesNeeded < Minitest::Test
  # Used to setup a new TileRack before each test
  def setup
    @tr = TileRack.new
  end

  # Tests to ensure and empty rack needs 7 tiles
  def test_empty_tile_rack_should_need_max_tiles
    assert_equal 7, @tr.number_of_tiles_needed
  end

  # Test to ensure that a rack with one tile only needs 6 to be full
  def test_tile_rack_with_one_tile_should_need_max_minus_one_tiles
    @tr.append('M')
    assert_equal 6, @tr.number_of_tiles_needed
  end

  # Test to ensure that a rack currently containing 4 tiles will need 3 more
  def test_tile_rack_with_several_tiles_should_need_some_tiles
    @tr.append('M')
    @tr.append('O')
    @tr.append('Z')
    @tr.append('L')
    assert_equal 3, @tr.number_of_tiles_needed
  end

  # Test to ensure that a full rack needs no tiles
  def test_that_full_tile_rack_doesnt_need_any_tiles
    @tr.append('P')
    @tr.append('A')
    @tr.append('N')
    @tr.append('L')
    @tr.append('R')
    @tr.append('G')
    @tr.append('Y')
    assert_equal 0, @tr.number_of_tiles_needed
  end
  
end
