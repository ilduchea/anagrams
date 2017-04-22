require('sinatra')
require('sinatra/reloader')
require('./lib/anagrams')

get('/') do
  erb(:index)
end

get('/results') do
  results = params.fetch('first_phrase').anagrams(params.fetch('second_phrase'))
  @anagram = results["anagram"]
  @phrase1_palindrome = results["reciever_palindrome"]
  @phrase2_palindrome = results["argument_palindrome"]
  @phrase1_word = results["reciever_actual_word"]
  @phrase2_word = results["argument_actual_word"]

  erb(:results)
end
