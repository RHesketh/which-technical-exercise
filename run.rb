require './environment'
require './lib/cat_finder_service'

raise StandardError.new('ENDPOINT_EMAIL has not been set! Did you copy .env.example to .env?') if ENV['ENDPOINT_EMAIL'].nil?

puts 'Attempting to locate the missing kittens...'
result = CatFinderService.new.call

if result == true
  puts 'The kittens were found!'
else
  puts 'Oh no, something went wrong!'
end
