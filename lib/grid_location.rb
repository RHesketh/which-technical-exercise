require 'http'

# Represents a location on a grid square
class GridLocation
  attr_accessor :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def move_north
    @y -= 1
  end

  def move_south
    @y += 1
  end

  def move_east
    @x += 1
  end

  def move_west
    @x -= 1
  end
end
