# THis class creates a tileRack object
class TileRack < TileGroup
  SIZE = 7

  def initialize
    super
  end

  # This method returns the number of tiles needed to refill the rack
  def number_of_tiles_needed
    return SIZE - @tiles.length
  end

  # This method returns true if the player has enough tiles to make the word represented by the text param
  def has_tiles_for?(text)
    @text = text
  end

end
