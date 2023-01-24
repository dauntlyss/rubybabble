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
    @text_array = string_to_array(@text)

    @calculated_array_length = @tiles.length - @text_array.length
    @calculated_array = subtract_arrays(@tiles, @text_array)

    if (@text_array != [] && @tiles.length >= @text_array.length && @calculated_array.length == @calculated_array_length)
      return true
    else
      return false
    end
  end

  # This method removes the played word tiles from the tilerack and returns a new Word
  def remove_word(text)
    @text = text
    @text_array = string_to_array(@text)
    @calculated_array = subtract_arrays(@tiles, @text_array)

    @text_array.each {|tile| remove(tile)}

    @new_word = Word.new
    @text_array.each {|tile| @new_word.append(tile.to_s)}

    return @new_word
  end

  # This helper method converts a string to an array of symbols
  def string_to_array(text)
    @text = text
    @string_array = @text.split("")
    @symbol_array = @text_string_array.map {|letter| letter.to_sym}
    return @symbol_array
  end

  # This helper method returns a new array with the played tiles removed
  def subtract_arrays(rack_array, word_array)
    @updated_array = rack_array.dup
    word_array.each do |element|
      if index = @updated_array.index(element)
        @updated_array.delete_at(index)
      end
    end
    return @updated_array
  end
  
end
