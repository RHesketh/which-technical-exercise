require './lib/orientation'

RSpec.describe Orientation, type: :model do
  describe '#facing' do
    it 'is initially North' do
      expect(subject.facing).to eq :north
    end
  end

  describe '#turn_left' do
    it 'Leaves us facing west if were facing north' do
      subject.facing = :north
      subject.turn_left
      expect(subject.facing).to eq :west
    end

    it 'Leaves us facing north if were facing east' do
      subject.facing = :east
      subject.turn_left
      expect(subject.facing).to eq :north
    end

    it 'Leaves us facing east if were facing south' do
      subject.facing = :south
      subject.turn_left
      expect(subject.facing).to eq :east
    end

    it 'Leaves us facing south if were facing west' do
      subject.facing = :west
      subject.turn_left
      expect(subject.facing).to eq :south
    end
  end

  describe '#turn_right' do
    it 'Leaves us facing east if were facing north' do
      subject.facing = :north
      subject.turn_right
      expect(subject.facing).to eq :east
    end

    it 'Leaves us facing south if were facing east' do
      subject.facing = :east
      subject.turn_right
      expect(subject.facing).to eq :south
    end

    it 'Leaves us facing west if were facing south' do
      subject.facing = :south
      subject.turn_right
      expect(subject.facing).to eq :west
    end

    it 'Leaves us facing north if were facing west' do
      subject.facing = :west
      subject.turn_right
      expect(subject.facing).to eq :north
    end
  end
end
