# This class creates a word object and tallies the score

class Word < TileGroup

  def initialize
    super
  end

  #This method returns the sum of all points for the tiles the word contains
  def score
    @score = 0
    if @tiles != []
      @tiles.each {|letter| @score += TileBag.points_for(letter.to_sym)}
    end
    @score
  end
end
