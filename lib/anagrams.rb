require('rest-client')

# current api takes over 10s to run rspec
class String
  define_method(:actual_word) do |word|
    api_result_hash = eval(RestClient.get("https://api.pearson.com/v2/dictionaries/ldoce5/entries?headword=#{word}&limit=1&apikey=mTD3NJzp4wJSsge5ZtTGA2D4umaZqUPj"))

    if api_result_hash[:count] > 0
      result = true
    else
      result = false
    end
    result
  end
end

#Code writen earlier by myself and Sara Schultz
define_method(:palindromes) do
  string_to_test = self.to_s.downcase().split(" ").join("")
  length = string_to_test.length
  counted_length = length.to_f./(2).ceil()
  booleans_array = []
  index = 0

  while index < counted_length do
    booleans_array.push(string_to_test[index].==(string_to_test[length.-(index.+(1))]))
    index += 1
  end

  !(booleans_array.include?(false))

end

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

    if !(booleans_array.include?(false))
      results_hash.store("anagram", "These words are anagrams")
    elsif !(booleans_array.include?(true))
      results_hash.store("anagram", "These words are antigrams")
    else
      results_hash.store("anagram", "These words are not anagrams but do contain some of the same letters")
    end

    if reciever_string.palindromes() == true
      results_hash.store("reciever_palindrome", "Phrase 1 is a palindrome")
    else
      results_hash.store("reciever_palindrome", "")
    end

    if argument_string.palindromes() == true
      results_hash.store("argument_palindrome", "Phrase 2 is a palindrome")
    else
      results_hash.store("argument_palindrome", "")
    end

    if reciever_word_booleans_array.include?(false)
      results_hash.store("reciever_actual_word", "Phrase 1 does not contain actual words or contains propper names")
    else
      results_hash.store("reciever_actual_word", "")
    end

    if argument_word_booleans_array.include?(false)
      results_hash.store("argument_actual_word", "Phrase 2 does not contain actual words or contains propper names")
    else
      results_hash.store("argument_actual_word", "")
    end

    results_hash
  end
end
