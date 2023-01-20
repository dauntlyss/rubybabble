# Tests tje initialize method of the TileGroup class

require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestInitialize < Minitest::Test
  # Used tp setup a new TileGroup before each test
  def setup
    @group = TileGroup.new
  end

  def test_create_empty_tile_group
    assert_equal [], @group.tiles
  end
end
