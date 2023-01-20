# Tests the initialize method of the Word class

require "minitest/autorun"
require_relative "../../word.rb"

class Word::TestInitialize < Minitest::Test
  # Used to setup a new Word before each test
  def setup
    @werd = Word.new
  end

  #Tests that an empty word is created at the initializtion of the word object
  def test_create_empty_word
    assert_equal [], @werd.tiles
  end
end
