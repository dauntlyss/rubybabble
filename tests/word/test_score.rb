# Tests the score method of the Word class

require "minitest/autorun"
require_relative "../../word.rb"
require_relative "../../tile_group.rb"

class Word::TestScore < Minitest::Test
  # Used to setup a new Word before each test
  def setup
    @werd = Word.new
  end

  #Tests that an empty word will score 0
  def test_empty_word_should_have_score_of_zero
    assert_equal 0, @werd.score
  end

  #Test that a single tile is scored as expected
  def test_score_a_one_tile_word
    @werd.append('A')
    assert_equal 1, @werd.score
  end

  #Tests that a multi tiled word is scored correctly
  def test_score_a_word_with_multiple_different_tiles
    @werd.append('P')
    @werd.append('E')
    @werd.append('A')
    @werd.append('N')
    @werd.append('U')
    @werd.append('T')
    assert_equal 8, @werd.score
  end

  #Tests that a word with reoccuring tiles will be scored correctly
  def test_score_a_word_with_recurring_tiles
    @werd.append('P')
    @werd.append('E')
    @werd.append('A')
    @werd.append('C')
    @werd.append('E')
    assert_equal 9, @werd.score
  end
end
