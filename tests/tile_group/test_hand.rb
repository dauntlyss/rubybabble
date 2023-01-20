# Tests the hand method of the TileGroup class

require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestHand < Minitest::Test
  # Used to setup a new TileGroup before each test
  def setup
    @group = TileGroup.new
  end

  # Tests the proper conversion of an empty group to empty string
  def test_convert_empty_group_to_string
    assert_equal "", @group.hand
  end

  # Tests the proper conversion of a single tile to string
  def test_convert_single_tile_group_to_string
    assert_equal "", @group.hand
    @group.append('A')
    assert_equal "A", @group.hand
  end

  # Tests the proper conversion of mutiple tiles to string
  def test_convert_multi_tile_group_to_string
    assert_equal "", @group.hand
    @group.append('D')
    @group.append('O')
    @group.append('G')
    assert_equal "DOG", @group.hand
  end

  # Tests the proper conversion of mutiple tiles with duplicates to string
  def test_convert_multi_tile_group_with_duplicates_to_string
    assert_equal "", @group.hand
    @group.append('B')
    @group.append('O')
    @group.append('T')
    @group.append('T')
    @group.append('L')
    @group.append('E')
    assert_equal "BOTTLE", @group.hand
  end

end
