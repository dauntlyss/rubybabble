# Tests the remove method of the TileGroup class

require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestRemove < Minitest::Test
  # Used to setup a new TileGroup before each test
  def setup
    @group = TileGroup.new
  end

  # Tests the proper removal of one tile from the group
  def test_remove_only_tile
    assert_equal "", @group.hand
    @group.append('A')
    assert_equal "A", @group.hand
    @group.remove('A')
    assert_equal "", @group.hand
  end

  # Tests the proper removal of the first tile of many from the group
  def test_remove_first_tile_from_many
    assert_equal "", @group.hand
    @group.append('H')
    @group.append('A')
    @group.append('M')
    assert_equal "HAM", @group.hand
    @group.remove('H')
    assert_equal "AM", @group.hand
  end

  # Tests the proper removal of the last tile of many from the group
  def test_remove_last_tile_from_many
    assert_equal "", @group.hand
    @group.append('L')
    @group.append('O')
    @group.append('V')
    @group.append('E')
    assert_equal "LOVE", @group.hand
    @group.remove('E')
    assert_equal "LOV", @group.hand
  end

  # Tests the proper removal of the middle tile of many from the group
  def test_remove_middle_tile_from_many
    @group.append('P')
    @group.append('E')
    @group.append('A')
    @group.append('C')
    @group.append('E')
    assert_equal "PEACE", @group.hand
    @group.remove('A')
    assert_equal "PECE", @group.hand
  end

  # Tests the proper removal of multiple tiles from the group
  def test_remove_multiple_tiles
    @group.append('P')
    @group.append('E')
    @group.append('A')
    @group.append('C')
    @group.append('E')
    @group.append('F')
    @group.append('L')
    assert_equal "PEACEFL", @group.hand
    @group.remove('A')
    @group.remove('C')
    @group.remove('E')
    assert_equal "PEFL", @group.hand
  end

  # Test to make sure duplicate letters are not removed
  def test_make_sure_duplicates_are_not_removed
    @group.append('P')
    @group.append('E')
    @group.append('A')
    @group.append('C')
    @group.append('E')
    @group.append('F')
    @group.append('L')
    assert_equal "PEACEFL", @group.hand

    @group.remove('E')
    assert_equal "PACEFL", @group.hand
  end

end
