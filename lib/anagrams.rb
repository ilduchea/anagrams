# require('palindromes')
# require('actual_word')

class String
  define_method(:anagrams) do |string|
    reciever_string = self.downcase().gsub(/[^0-9A-Za-z]/, '') #turns input into a string with no spaces or special characters
    argument_string = string.downcase().gsub(/[^0-9A-Za-z]/, '') #turns input into a string with no spaces or special characters
    reciever_array = self.downcase().gsub(/[^0-9A-Za-z ]/, '').split(' ') #turns input into an array of words with no special characters
    argument_array = string.downcase().gsub(/[^0-9A-Za-z ]/, '').split(' ') #turns input into an array of words with no special characters
    results_hash = Hash.new()
    booleans_array = []
    reciever_word_booleans_array = []
    argument_word_booleans_array = []

    # checks each character of the reciever against the argument
    reciever_string.each_char do |c|
      booleans_array.push(argument_string.include?(c))
    end

    # checks if each word of the reciever is actually a word. Some propper names are returned as false
    reciever_array.each do |word|
      reciever_word_booleans_array.push(actual_word(word))
    end

    # checks if each word of the argument is actually a word. Some propper names are returned as false
    argument_array.each do |word|
      argument_word_booleans_array.push(actual_word(word))
    end

    results_hash.store("anagram", !(booleans_array.include?(false)))
    results_hash.store("antigram", !(booleans_array.include?(true)))
    results_hash.store("reciever_palindrome", reciever_string.palindromes())
    results_hash.store("argument_palindrome", argument_string.palindromes())
    results_hash.store("reciever_actual_word", !(reciever_word_booleans_array.include?(false)))
    results_hash.store("argument_actual_word", !(argument_word_booleans_array.include?(false)))

    results_hash
  end
end
