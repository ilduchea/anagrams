class String
  define_method(:anagrams) do |string|
    reciever_string_array = self.split('')
    argument_string_array = string.split('')
    booleans_array = []

    each_char do |c|
      booleans_array.push(string.include?(c))
    end

    !(booleans_array.include?(false))
  end
end
