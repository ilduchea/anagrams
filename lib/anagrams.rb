class String
  define_method(:anagrams) do |string|
    reciever_string = self.downcase()
    argument_string = string.downcase()
    booleans_array = []

    reciever_string.each_char do |c|
      booleans_array.push(argument_string.include?(c))
    end

    !(booleans_array.include?(false))
  end
end
