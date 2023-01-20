# Tests for point values

require "minitest/autorun"
require_relative "../../tile_bag.rb"

class TileBag::TestPointsFor < Minitest::Test
  # Used to setup a new tilebag for each test method
  def setup
    TileBag.new
  end

  # Test to check the point values returned for each letter
  def test_confirm_point_values
    assert_equal 1, TileBag.points_for('A')
    assert_equal 3, TileBag.points_for('B')
    assert_equal 3, TileBag.points_for('C')
    assert_equal 2, TileBag.points_for('D')
    assert_equal 1, TileBag.points_for('E')
    assert_equal 4, TileBag.points_for('F')
    assert_equal 2, TileBag.points_for('G')
    assert_equal 4, TileBag.points_for('H')
    assert_equal 1, TileBag.points_for('I')
    assert_equal 8, TileBag.points_for('J')
    assert_equal 5, TileBag.points_for('K')
    assert_equal 1, TileBag.points_for('L')
    assert_equal 3, TileBag.points_for('M')
    assert_equal 1, TileBag.points_for('N')
    assert_equal 3, TileBag.points_for('O')
    assert_equal 3, TileBag.points_for('P')
    assert_equal 10, TileBag.points_for('Q')
    assert_equal 1, TileBag.points_for('R')
    assert_equal 1, TileBag.points_for('S')
    assert_equal 1, TileBag.points_for('T')
    assert_equal 1, TileBag.points_for('U')
    assert_equal 4, TileBag.points_for('V')
    assert_equal 4, TileBag.points_for('W')
    assert_equal 8, TileBag.points_for('X')
    assert_equal 4, TileBag.points_for('Y')
    assert_equal 10, TileBag.points_for('Z')
  end
  
end
