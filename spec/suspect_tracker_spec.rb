require './lib/suspect_tracker.rb'

RSpec.describe SuspectTracker, type: :model do
  describe '#call' do
    it 'Moves the suspect forward when instructed' do
      suspect = Suspect.new
      subject = described_class.new(suspect: suspect)

      expect(suspect).to receive(:move_forward)
      subject.call(['forward'])
    end

    it 'Turns the suspect left when instructed' do
      suspect = Suspect.new
      subject = described_class.new(suspect: suspect)

      expect(suspect).to receive(:turn_left)
      subject.call(['left'])
    end

    it 'Turns the suspect right when instructed' do
      suspect = Suspect.new
      subject = described_class.new(suspect: suspect)

      expect(suspect).to receive(:turn_right)
      subject.call(['right'])
    end

    it 'Executes multiple instructions in the correct order' do
      suspect = Suspect.new
      subject = described_class.new(suspect: suspect)

      expect(suspect).to receive(:move_forward).ordered
      expect(suspect).to receive(:turn_left).ordered
      expect(suspect).to receive(:turn_right).ordered
      expect(suspect).to receive(:move_forward).ordered

      subject.call(%w[forward left right forward])
    end

    it 'Returns the suspect when it is done moving them around' do
      suspect = Suspect.new
      subject = described_class.new(suspect: suspect)

      expect(subject.call([])).to eq suspect
    end
  end
end
