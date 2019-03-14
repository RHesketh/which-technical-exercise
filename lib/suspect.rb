require 'http'

# Represents the movement and orientation of a suspect on a grid
class Suspect
  attr_reader :location

  def initialize(orientation: Orientation.new, location: GridLocation.new)
    @orientation = orientation
    @location = location
  end

  def facing
    @orientation.facing
  end

  def turn_left
    @orientation.turn_left
  end

  def turn_right
    @orientation.turn_right
  end

  def move_forward
    direction = facing.to_s
    @location.send("move_#{direction}")
  end
end
