require('rspec')
require('anagrams')

describe('String#anagrams') do
  it('will check if two letters are the same') do
    expect("a".anagrams("a")).to(eq({"anagram"=>true, "reciever_palindrome"=>true, "argument_palindrome"=>true}))
  end

  it('will check if two strings have same letters') do
    expect("ruby".anagrams("bury")).to(eq({"anagram"=>true, "reciever_palindrome"=>false, "argument_palindrome"=>false}))
  end

  it('will return false if two strings do not have same letters') do
    expect("ruby".anagrams("test")).to(eq({"anagram"=>false, "reciever_palindrome"=>false, "argument_palindrome"=>false}))
  end

  it('will be case insensitive') do
    expect("RuBy".anagrams("bUrY")).to(eq({"anagram"=>true, "reciever_palindrome"=>false, "argument_palindrome"=>false}))
  end

  it('will check if the strings are palindromes') do
    expect("racecar".anagrams("craearc")).to(eq({"anagram"=>true, "reciever_palindrome"=>true, "argument_palindrome"=>true}))
  end

end
