require './lib/directions_client'
require './lib/suspect_tracker'
require './lib/locations_client'

# Locates missing kittens
class CatFinderService
  def initialize(directions_client: DirectionsClient.new, suspect_tracker: SuspectTracker.new, locations_client: LocationsClient.new)
    @directions_client = directions_client
    @suspect_tracker = suspect_tracker
    @locations_client = locations_client
  end

  def call
    directions = directions_client.get
    suspect = suspect_tracker.call(directions)
    locations_client.submit(x: suspect.location.x, y: suspect.location.y)
  end

  private

  attr_reader :directions_client, :suspect_tracker, :locations_client
end
