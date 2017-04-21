require('sinatra')
require('sinatra/reloader')
require('./lib/anagrams')

get('/') do
  erb(:index)
end
