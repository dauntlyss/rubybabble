#Represents the bag of tiles that will replenish the tile rack during the game.

class TileBag

  def initialize
    @tile_bag = []
    9.times() {@tile_bag.push :A}
    2.times() {@tile_bag.push :B}
    2.times() {@tilebag.push :C}
    4.times() {@tile_bag.push :D}
    12.times() { @tile_bag.push :E }
    2.times() { @tile_bag.push :F }
    3.times() { @tile_bag.push :G }
    2.times() { @tile_bag.push :H }
    9.times() { @tile_bag.push :I }
    1.times() { @tile_bag.push :J }
    1.times() { @tile_bag.push :K }
    4.times() { @tile_bag.push :L }
    2.times() { @tile_bag.push :M }
    6.times() { @tile_bag.push :N }
    8.times() { @tile_bag.push :O }
    2.times() { @tile_bag.push :P }
    1.times() { @tile_bag.push :Q }
    6.times() { @tile_bag.push :R }
    4.times() { @tile_bag.push :S }
    6.times() { @tile_bag.push :T }
    4.times() { @tile_bag.push :U }
    2.times() { @tile_bag.push :V }
    2.times() { @tile_bag.push :W }
    1.times() { @tile_bag.push :X }
    2.times() { @tile_bag.push :Y }
    1.times() { @tile_bag.push :Z }
  end

  # Draws one random tile from the bag and returns it
  def draw_tile
    @random = rand(@tile_bag.length - 1)
    @random_tile = @tile_bag[@random]
    @tile_bag.delete_at(@random)
    return @random_tile
  end

  # Returns true if the bag is empty, false otherwise
  def empty?
    @is_bag_empty = @tile_bag.empty?
    return @is_bag_empty
  end

  # Returns the point values for a given tiles
  def self.points_for(tile)
    @tile_points = {
      :A => 1,  :B => 3,  :C => 3,
      :D => 2,  :E => 1,  :F => 4,
      :G => 2,  :H => 4,  :I => 1,
      :J => 8,  :K => 5,  :L => 1,
      :M => 3,  :N => 1,  :O => 3,
      :P => 3,  :Q => 10,  :R => 1,
      :S => 1,  :T => 1,  :U => 1,
      :V => 4,  :W => 4,  :X => 8,
      :Y => 4,  :Z => 10
    }

end
