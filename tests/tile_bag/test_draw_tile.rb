# Unit tests for the TileBag's draw_tile method

require "minitest/autorun"
require_relative "../../tile_bag.rb"

class TileBag::TestDrawTile < Minitest::Test

  # Sets up a new tile bag before each Test
  def setup
    @bag = TileBag.new
  end

  #Tests to check that the bag contains 98 tiles at generation and all 98 tiles can be removed, resulting in an empty bag.
  def test_has_proper_number_of_tiles
    assert_equal false, @bag.empty?
    98.times() {@bag.draw_tile}
    assert_equal true, @bag.empty?
  end

  #Tests that the tiles in the bag have the proper number of each letter
  def test_has_proper_tile_distribution
    @sample_bag = []
    98.times() {
      @tile = @bag.draw_tile.to_s
      @sample_bag.push @tile
    }
    assert_equal 9, @sample_bag.count('A')
    assert_equal 2, @sample_bag.count('B')
    assert_equal 2, @sample_bag.count('C')
    assert_equal 4, @sample_bag.count('D')
    assert_equal 12, @sample_bag.count('E')
    assert_equal 2, @sample_bag.count('F')
    assert_equal 3, @sample_bag.count('G')
    assert_equal 2, @sample_bag.count('H')
    assert_equal 9, @sample_bag.count('I')
    assert_equal 1, @sample_bag.count('J')
    assert_equal 1, @sample_bag.count('K')
    assert_equal 4, @sample_bag.count('L')
    assert_equal 2, @sample_bag.count('M')
    assert_equal 6, @sample_bag.count('N')
    assert_equal 8, @sample_bag.count('O')
    assert_equal 2, @sample_bag.count('P')
    assert_equal 1, @sample_bag.count('Q')
    assert_equal 6, @sample_bag.count('R')
    assert_equal 4, @sample_bag.count('S')
    assert_equal 6, @sample_bag.count('T')
    assert_equal 4, @sample_bag.count('U')
    assert_equal 2, @sample_bag.count('V')
    assert_equal 2, @sample_bag.count('W')
    assert_equal 1, @sample_bag.count('X')
    assert_equal 2, @sample_bag.count('Y')
    assert_equal 1, @sample_bag.count('Z')
  end
end
