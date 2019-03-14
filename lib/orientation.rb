# Represents the cardinal direction in which something is currently facing
class Orientation
  attr_accessor :facing

  def initialize
    @facing = :north
  end

  def turn_left
    case @facing
    when :north
      @facing = :west
    when :east
      @facing = :north
    when :south
      @facing = :east
    when :west
      @facing = :south
    end
  end

  def turn_right
    case @facing
    when :north
      @facing = :east
    when :east
      @facing = :south
    when :south
      @facing = :west
    when :west
      @facing = :north
    end
  end
end
