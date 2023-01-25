# Tests the remove_word method of the TileRack class

require "minitest/autorun"
require_relative "../../tile_rack.rb"
require_relative "../../tile_group.rb"

class TileRack::TestRemoveWord < Minitest::Test
  # Used to setup a new TileRack before each test
  def setup
    @tr = TileRack.new
  end

  # Test that the inputed word can be removed from the rack when ltrs are in order
  def test_can_remove_a_word_whose_letters_are_in_order_on_the_rack
    @tr.append('W')
    @tr.append('A')
    @tr.append('L')
    @tr.append('K')
    @tr.append('S')
    @tr.append('E')
    @tr.append('D')
    @word = @tr.remove_word('WALKS')
    assert_equal [:W, :A, :L, :K, :S], @word.tiles
  end

  # Test that the inputed word can be removed from the rack when ltrs are not in order
  def test_can_remove_a_word_whose_letters_are_not_in_order_on_the_rack
    @tr.append('L')
    @tr.append('C')
    @tr.append('K')
    @tr.append('E')
    @tr.append('A')
    @tr.append('S')
    @tr.append('W')
    @word = @tr.remove_word('WALKS')
    assert_equal [:W, :A, :L, :K, :S], @word.tiles
  end

  # Test that a word with dup letters will be properly removed
  def test_can_remove_word_with_duplicate_letters
    @tr.append('P')
    @tr.append('E')
    @tr.append('A')
    @tr.append('C')
    @tr.append('S')
    @tr.append('E')
    @tr.append('D')
    @word = @tr.remove_word('PEACE')
    assert_equal [:P, :E, :A, :C, :E], @word.tiles
  end

  # Tests to make sure letter in words are removed not unused duplicate letters
  def test_can_remove_word_without_removing_unneeded_duplicate_letters
    @tr.append('P')
    @tr.append('E')
    @tr.append('A')
    @tr.append('C')
    @tr.append('E')
    @tr.append('E')
    @tr.append('D')
    @word = @tr.remove_word('PEACE')
    assert_equal [:P, :E, :A, :C, :E], @word.tiles
  end
end
