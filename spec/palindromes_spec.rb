require('rspec')
require('palindromes')

describe('String#palindromes') do
  it('will return false if a word is not a palindrome') do
    expect(("at").palindromes()).to(eq(false))
  end

  it('will compare a single letter word') do
    expect(("a").palindromes()).to(eq(true))
  end

  it('will compare a two letter word') do
    expect(("aa").palindromes()).to(eq(true))
  end

  it('will compare a three letter word') do
    expect(("pop").palindromes()).to(eq(true))
  end

  it('will compare a 6 letter word') do
    expect(("hannah").palindromes()).to(eq(true))
  end

  it('will compare a number') do
    expect((55.55).palindromes()).to(eq(true))
  end

  it('will compare a sentece') do
    expect(('Too hot to hoot').palindromes()).to(eq(true))
  end

  it('will compare a sequence of characters or symbols') do
    expect(('!@##@!').palindromes()).to(eq(true))
  end

  it('will compare a sentece with symbols') do
    expect(('Eve, mad Adam, Eve!').palindromes()).to(eq(false))
  end
end
