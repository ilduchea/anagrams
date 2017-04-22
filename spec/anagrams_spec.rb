require('rspec')
require('anagrams')

describe('String#anagrams') do
  it('will check if two letters are the same') do
    expect("a".anagrams("a")).to(include("anagram"=>"These words are anagrams"))
  end

  it('will check if two strings have same letters') do
    expect("ruby".anagrams("bury")).to(include("anagram"=>"These words are anagrams"))
  end

  it('will return false if two strings do not have same letters') do
    expect("ruby".anagrams("test")).to(include("anagram"=>"These words are antigrams"))
  end

  it('will be case insensitive') do
    expect("RuBy".anagrams("bUrY")).to(include("anagram"=>"These words are anagrams"))
  end

  it('will check if the strings are palindromes') do
    expect("racecar".anagrams("craearc")).to(include("reciever_palindrome"=>"Phrase 1 is a palindrome", "argument_palindrome"=>"Phrase 2 is a palindrome"))
  end

  it('will check if the strings are words') do
    expect("racecar".anagrams("craearc")).to(include("reciever_actual_word"=>"Phrase 1 does not contain actual words or contains propper names", "argument_actual_word"=>"Phrase 2 does not contain actual words or contains propper names"))
  end

  it('will check if the strings are antigrams') do
    expect("ruby".anagrams("diamond")).to(include("anagram"=>"These words are antigrams"))
  end

  it('will work on phrases') do
    expect("Tom Marvolo Riddle".anagrams("I am Lord Voldemort")).to(include("anagram"=>"These words are anagrams"))
  end

end
