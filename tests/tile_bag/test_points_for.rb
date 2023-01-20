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
    [:A, :E, :I, :L, :N, :R, :S, :T, :U].each do |tile|
      assert_equal 1, TileBag.points_for(tile)
    end

    [:D, :G].each do |tile|
      assert_equal 2, TileBag.points_for(tile)
    end

    [:B, :C, :M, :O, :P].each do |tile|
      assert_equal 3, TileBag.points_for(tile)
    end

    [:F, :H, :V, :W, :Y].each do |tile|
      assert_equal 4, TileBag.points_for(tile)
    end

    assert_equal 5, TileBag.points_for(:K)

    [:J, :X].each do |tile|
      assert_equal 8, TileBag.points_for(tile)
    end

    [:Q, :Z].each do |tile|
      assert_equal 10, TileBag.points_for(tile)
    end
  end

end
