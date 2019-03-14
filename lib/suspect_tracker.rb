require './lib/suspect.rb'

# Recreates a suspect's movements based on a provided set of directions
class SuspectTracker
  def initialize(suspect: Suspect.new)
    @suspect = suspect
  end

  def call(instructions)
    instructions.each do |instruction|
      process_instruction(instruction)
    end

    @suspect
  end

  private

  def process_instruction(instruction)
    case instruction
    when 'forward'
      @suspect.move_forward
    when 'left'
      @suspect.turn_left
    when 'right'
      @suspect.turn_right
    end
  end
end
