require './environment'
require './lib/cat_finder_service'

puts 'Attempting to locate the missing kittens...'
result = CatFinderService.new.call

if result == true
  puts 'The kittens were found!'
else
  puts 'Oh no, something went wrong!'
end
