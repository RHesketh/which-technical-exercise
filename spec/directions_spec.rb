require './lib/directions.rb'

RSpec.describe Directions, type: :model do
  describe '#get' do
    it 'Makes a call to a remote service to retrieve the direction information' do
      response_body = { 'directions' => %w[up down] }.to_json
      response = double(:response, body: response_body)
      http_client = class_double(HTTP, get: response)
      subject = described_class.new(http_client: http_client)

      expect(subject.get).to eq %w[up down]
    end

    context 'Error handling' do
      it 'Raises an error if the response did not contain direction information' do
        response_body = { 'error' => 'something went wrong' }.to_json
        response = double(:response, body: response_body)
        http_client = class_double(HTTP, get: response)
        subject = described_class.new(http_client: http_client)

        expect { subject.get }.to raise_error(Directions::NoDirectionsError)
      end
    end
  end
end
