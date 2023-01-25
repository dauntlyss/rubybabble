require 'spellchecker'
require 'tempfile'

require_relative "./tile_group.rb"
require_relative "./tile_bag.rb"
require_relative "./tile_rack.rb"
require_relative "./word.rb"

# This class is used to create and run the logic of the Babble game

class Babble
  MAX_SIZE = 7

  def initialize
    @bag = TileBag.new
    @group = TileGroup.new
    @rack = TileRack.new
    @word = Word.new
    @user_input = ""
    @total_score = 0
    @total_tiles_played = 0
  end

  # This method runs the game, populates all tiles and prompts the player for input
  def run()
    puts ""
    puts "**********************************************"
    puts "BABBLE GAME"
    puts "To quit the game, type ':quit'"
    puts "**********************************************"
    puts ""

    until (@user_input == ":quit")
      get_tiles
      puts "Please create a word using these letter tiles: " + @rack.hand
      signal = "> "
      print signal
      @user_input = gets.chomp.upcase

      if @user_input == ":quit" || @user_input == ":QUIT"
        break
      elsif @user_input == ""
        puts "Please create a word using these letter tiles: "
        display_score
      elsif (@user_input != "" && @rack.has_tiles_for?(@user_input) == false)
        puts "Not enough tiles"
        display_score
      elsif (@user_input != "" && Spellchecker::check(@user_input)[0][:correct] == true && @rack.has_tiles_for?(@user_input) == true)
        score_word
      else
        puts "Not a valid word"
        display_score
      end
    end

    end_game
  end

  def get_tiles
    if (@bag.empty? == false && @rack.number_of_tiles_needed <= @bag.contents_count)
      @rack.number_of_tiles_needed.times() {
        draw_tiles
      }
    elsif (@bag.empty? == false && @bag.contents_count > 0)
      @bag.contents_count.times() {
        draw_tiles
      }
    elsif (@bag.empty? == true && @rack.number_of_tiles_needed == MAX_SIZE)
      puts "There are no more tiles in the bag."
      end_game
    end
  end

  # This method scores a valid word.
  def score_word
    @played_word = @rack.remove_word(@user_input)
    @word_tiles = @played_word.tiles
    @word_score = @played_word.score
    puts "You made " + @user_input.to_s + " for " + @word_score.to_s + " points"
    calculate_total_score(@word_score)
    number_of_tiles_played(@word_tiles.length)
    puts "Your new score is: " + @total_score.to_s
  end

  def calculate_total_score(score)
    @score = score
    @total_score += @score
    return @total_score
  end

  def display_score
    puts "Current score: " + @total_score.to_s
  end

  def number_of_tiles_played(number_played)
    @number_played = number_played
    @total_tiles_played += @number_played
    return @total_tiles_played
  end

  def draw_tiles
    @new_tile = @bag.draw_tile
    @rack.append(@new_tile)
  end

  def end_game
    puts ""
    puts "**********************************"
    puts "Thanks for playing, total score " + @total_score.to_s
    puts ""
  end

end

Babble.new.run
