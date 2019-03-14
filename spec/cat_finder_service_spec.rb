require './lib/cat_finder_service'

RSpec.describe CatFinderService, type: :model do
  describe '#call' do
    it 'Uses a remote API to receive suspect movement information' do
      directions_client = instance_double(DirectionsClient, get: [])
      subject = described_class.new(directions_client: directions_client)

      expect(directions_client).to receive(:get)

      subject.call
    end

    it 'Passes the directions to a suspect tracker' do
      instructions = ['forward']
      directions_client = instance_double(DirectionsClient, get: instructions)
      suspect = double(Suspect, location: Struct.new(:x, :y).new(5, 5))
      suspect_tracker = instance_double(SuspectTracker)
      subject = described_class.new(
        directions_client: directions_client,
        suspect_tracker: suspect_tracker
      )

      expect(suspect_tracker).to receive(:call).with(instructions).and_return(suspect)

      subject.call
    end

    it 'Contacts a remote API to inform it of the suspect location' do
      directions_client = instance_double(DirectionsClient, get: [])
      suspect = double(Suspect, location: Struct.new(:x, :y).new(5, 5))
      suspect_tracker = instance_double(SuspectTracker, call: suspect)
      locations_client = instance_double(LocationsClient)
      subject = described_class.new(
        directions_client: directions_client,
        suspect_tracker: suspect_tracker,
        locations_client: locations_client
      )

      expect(locations_client).to receive(:submit).with(x: 5, y: 5)

      subject.call
    end

    it 'returns true if location was submitted successfully' do
      directions_client = instance_double(DirectionsClient, get: [])
      suspect = double(Suspect, location: Struct.new(:x, :y).new(5, 5))
      suspect_tracker = instance_double(SuspectTracker, call: suspect)
      locations_client = instance_double(LocationsClient, submit: true)
      subject = described_class.new(
        directions_client: directions_client,
        suspect_tracker: suspect_tracker,
        locations_client: locations_client
      )

      expect(subject.call).to eq true
    end
  end
end
