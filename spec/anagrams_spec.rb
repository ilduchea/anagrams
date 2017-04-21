require('rspec')
require('anagrams')

describe('String#anagrams') do
  it('will check if two letters are the same') do
    expect("a".anagrams("a")).to(eq(true))
  end

  it('will check if two strings have same letters') do
    expect("ruby".anagrams("bury")).to(eq(true))
  end

  it('will return false if two strings do not have same letters') do
    expect("ruby".anagrams("test")).to(eq(false))
  end

end
