require './lib/grid_location.rb'

RSpec.describe GridLocation, type: :model do
  describe '#x' do
    it 'Is initially 0' do
      expect(subject.x).to eq 0
    end
  end

  describe '#y' do
    it 'Is initially 0' do
      expect(subject.y).to eq 0
    end
  end

  describe '#move_north' do
    it 'Moves the grid location one tile to the north' do
      subject.move_north

      expect(subject.x).to eq 0
      expect(subject.y).to eq(1)
    end
  end

  describe '#move_south' do
    it 'Moves the grid location one tile to the south' do
      subject.move_south

      expect(subject.x).to eq 0
      expect(subject.y).to eq -1
    end
  end

  describe '#move_east' do
    it 'Moves the grid location one tile to the east' do
      subject.move_east

      expect(subject.x).to eq 1
      expect(subject.y).to eq 0
    end
  end

  describe '#move_west' do
    it 'Moves the grid location one tile to the west' do
      subject.move_west

      expect(subject.x).to eq(-1)
      expect(subject.y).to eq 0
    end
  end
end
