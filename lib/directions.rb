require 'http'

# Contacts a remote service to retrieve direction information
class Directions
  HOST = 'http://which-technical-exercise.herokuapp.com/api'.freeze
  ENDPOINT = 'directions'.freeze

  def initialize(http_client: HTTP)
    @http_client = http_client
  end

  def get
    response = JSON.parse(response_body)
    raise NoDirectionsError unless response.key? 'directions'

    response['directions']
  end

  private

  def response_body
    request.body.to_s
  end

  def request
    @http_client.get(url)
  end

  def url
    "#{HOST}/#{ENV['ENDPOINT_EMAIL']}/#{ENDPOINT}"
  end

  class NoDirectionsError < StandardError; end
end
