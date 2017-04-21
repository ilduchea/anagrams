require('palindromes')

class String
  define_method(:anagrams) do |string|
    reciever_string = self.downcase()
    argument_string = string.downcase()
    results_hash = Hash.new()
    results_hash.store("anagram", "")
    booleans_array = []

    reciever_string.each_char do |c|
      booleans_array.push(argument_string.include?(c))
    end

    results_hash.store("anagram", !(booleans_array.include?(false)))
    results_hash.store("reciever_palindrome", reciever_string.palindromes())
    results_hash.store("argument_palindrome", argument_string.palindromes())

    results_hash
  end
end
