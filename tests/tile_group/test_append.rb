# Tests the append method of the TileGroup class

require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestAppend < Minitest::Test
  # Used to setup a new TileGroup before each test
  def setup
    @group = TileGroup.new
  end

  #Test that appends one tile to the group
  def test_append_one_tile
    @group.append('A')
    assert_equal "A", @group.hand
  end

  #Test that appends many tiles to the group
  def test_append_many_tiles
    @group.append('R')
    @group.append('S')
    @group.append('T')
    @group.append('L')
    @group.append('N')
    @group.append('E')
    @group.append('E')
    assert_equal "RSTLNEE", @group.hand
  end

  #Test that appends duplicate tiles to the group
  def test_append_duplicate_tiles
    @group.append('E')
    @group.append('E')
    @group.append('E')
  end

end
