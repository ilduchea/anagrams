require('palindromes')
require('actual_word')

class String
  define_method(:anagrams) do |string|
    reciever_string = self.downcase().gsub(/[^0-9A-Za-z]/, '')
    argument_string = string.downcase().gsub(/[^0-9A-Za-z]/, '')
    reciever_array = self.downcase().gsub(/[^0-9A-Za-z ]/, '').split(' ')
    argument_array = string.downcase().gsub(/[^0-9A-Za-z ]/, '').split(' ')
    results_hash = Hash.new()
    booleans_array = []
    reciever_word_booleans_array = []
    argument_word_booleans_array = []
puts(reciever_string)
    reciever_string.each_char do |c|
      booleans_array.push(argument_string.include?(c))
    end

    reciever_array.each do |word|
      reciever_word_booleans_array.push(actual_word(word))
    end

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
