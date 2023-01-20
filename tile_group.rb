#This class creates a TileGroup object that will control the addition and subtraction of tiles along with displaying of the players hand

class TileGroup
  attr_accessor :tiles

  def initialize
    @tiles = []
  end

  #Appends a tile to the group
  def append(tile)
    @tiles.push tile.to_sym
  end

  #Removes tiles from the group
  def remove(tile)
    @index = @tiles.index(tile.to_sym)
    @tiles.delete_at(@index)
  end

  def hand
    @hand_array = []
    @tiles.each { |tile| @hand_array.push(tile.to_s) }
    @hand = @hand_array.join("")
    @hand
  end
end
