require('rspec')
require('anagrams')

describe('String#anagrams') do
  it('will check if two letters are the same') do
    expect("a".anagrams("a")).to(eq({"anagram"=>true, "reciever_palindrome"=>true, "antigram"=>false, "argument_palindrome"=>true, "reciever_actual_word"=>true, "argument_actual_word"=>true}))
  end

  it('will check if two strings have same letters') do
    expect("ruby".anagrams("bury")).to(eq({"anagram"=>true, "antigram"=>false, "reciever_palindrome"=>false, "argument_palindrome"=>false, "reciever_actual_word"=>true, "argument_actual_word"=>true}))
  end

  it('will return false if two strings do not have same letters') do
    expect("ruby".anagrams("test")).to(eq({"anagram"=>false, "antigram"=>true, "reciever_palindrome"=>false, "argument_palindrome"=>false, "reciever_actual_word"=>true, "argument_actual_word"=>true}))
  end

  it('will be case insensitive') do
    expect("RuBy".anagrams("bUrY")).to(eq({"anagram"=>true, "antigram"=>false, "reciever_palindrome"=>false, "argument_palindrome"=>false, "reciever_actual_word"=>true, "argument_actual_word"=>true}))
  end

  it('will check if the strings are palindromes') do
    expect("racecar".anagrams("craearc")).to(eq({"anagram"=>true, "antigram"=>false, "reciever_palindrome"=>true, "argument_palindrome"=>true, "reciever_actual_word"=>false, "argument_actual_word"=>false}))
  end

  it('will check if the strings are words') do
    expect("racecar".anagrams("craearc")).to(eq({"anagram"=>true, "antigram"=>false, "reciever_palindrome"=>true, "argument_palindrome"=>true, "reciever_actual_word"=>false, "argument_actual_word"=>false}))
  end

  it('will check if the strings are antigrams') do
    expect("ruby".anagrams("diamond")).to(eq({"anagram"=>false, "antigram"=>true, "reciever_palindrome"=>false, "argument_palindrome"=>false, "reciever_actual_word"=>true, "argument_actual_word"=>true}))
  end

end
