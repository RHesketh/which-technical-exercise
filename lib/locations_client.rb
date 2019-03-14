require 'http'

# Contacts a remote service to send cat location information
class LocationsClient
  HOST = 'http://which-technical-exercise.herokuapp.com/api'.freeze
  ENDPOINT = 'location'.freeze

  def initialize(http_client: HTTP)
    @http_client = http_client
  end

  def submit(x:, y:) # rubocop:disable Naming/UncommunicativeMethodParamName
    response = request(x, y)
    raise IncorrectSubmissionError unless response.code == 200 # OK

    true
  end

  private

  def request(x, y) # rubocop:disable Naming/UncommunicativeMethodParamName
    url = url_for(x, y)
    http_client.get(url)
  end

  def url_for(x, y) # rubocop:disable Naming/UncommunicativeMethodParamName
    "#{HOST}/#{ENV['ENDPOINT_EMAIL']}/#{ENDPOINT}/#{x}/#{y}"
  end

  class IncorrectSubmissionError < StandardError; end

  attr_reader :http_client
end
