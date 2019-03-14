require './lib/suspect'

RSpec.describe Suspect, type: :model do
  it 'begins by facing North' do
    expect(subject.facing).to eq :north
  end

  it 'begins at location 0,0' do
    expect(subject.location.x).to eq 0
    expect(subject.location.y).to eq 0
  end

  describe '#turn_left' do
    it 'Turns to the left' do
      orientation = instance_double(Orientation)
      subject = described_class.new(orientation: orientation)
      expect(orientation).to receive(:turn_left)

      subject.turn_left
    end
  end

  describe '#turn_right' do
    it 'Turns to the right' do
      orientation = instance_double(Orientation)
      subject = described_class.new(orientation: orientation)
      expect(orientation).to receive(:turn_right)

      subject.turn_right
    end
  end

  describe '#move_forward' do
    it 'Moves the suspect North when they are facing North' do
      orientation = instance_double(Orientation, facing: :north)
      location = instance_double(GridLocation)
      subject = described_class.new(orientation: orientation, location: location)
      expect(location).to receive(:move_north)

      subject.move_forward
    end

    it 'Moves the suspect East when they are facing East' do
      orientation = instance_double(Orientation, facing: :east)
      location = instance_double(GridLocation)
      subject = described_class.new(orientation: orientation, location: location)
      expect(location).to receive(:move_east)

      subject.move_forward
    end

    it 'Moves the suspect South when they are facing South' do
      orientation = instance_double(Orientation, facing: :south)
      location = instance_double(GridLocation)
      subject = described_class.new(orientation: orientation, location: location)
      expect(location).to receive(:move_south)

      subject.move_forward
    end

    it 'Moves the suspect West when they are facing West' do
      orientation = instance_double(Orientation, facing: :west)
      location = instance_double(GridLocation)
      subject = described_class.new(orientation: orientation, location: location)
      expect(location).to receive(:move_west)

      subject.move_forward
    end
  end
end
