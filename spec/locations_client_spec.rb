require './lib/locations_client'

RSpec.describe LocationsClient, type: :model do
  describe '#submit' do
    it 'Makes a call to a remote service based on the provided coordinates' do
      response = double(:response, code: 200)
      http_client = class_double(HTTP, get: response)
      subject = described_class.new(http_client: http_client)

      expected_url = "#{LocationsClient::HOST}/#{ENV['ENDPOINT_EMAIL']}/#{LocationsClient::ENDPOINT}/5/7"
      expect(http_client).to receive(:get).with(expected_url)

      subject.submit(x: 5, y: 7)
    end

    it 'returns true if the response was successfully received' do
      response = double(:response, code: 200)
      http_client = class_double(HTTP, get: response)
      subject = described_class.new(http_client: http_client)

      expect(subject.submit(x: 0, y: 0)).to eq true
    end

    context 'Error handling' do
      # NOTE: This functionality may change. I have assumed that a successful
      # submission will return a 200 OK whereas an unsuccessful submission
      # will return an error status. I have no documentation nor was I able to
      # get an error response from the endpoint that verifies this assumption.
      it 'Raises an error if the response was not 200 OK' do
        response = double(:response, code: 500)
        http_client = class_double(HTTP, get: response)
        subject = described_class.new(http_client: http_client)

        expect { subject.submit(x: 0, y: 0) }.to raise_error(LocationsClient::IncorrectSubmissionError)
      end
    end
  end
end
