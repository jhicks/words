require 'minitest/autorun'
require_relative '../word'

describe Word do
  it 'assigns the value of the word' do
    word = Word.new('abcdefgh ijkl mn`op qrst~uv wxyz')
    word.value.must_equal 'abcdefgh ijkl mn`op qrst~uv wxyz'
  end

  it 'ignores leading and trailing whitespace' do
    word = Word.new('  abcd')
    word.sequences.must_equal ['abcd']

    word = Word.new('Abcd   ')
    word.sequences.must_equal ['Abcd']

    word = Word.new("aBcd\n")
    word.sequences.must_equal ['aBcd']

    word = Word.new("  abcD \n")
    word.sequences.must_equal ['abcD']
  end

  it 'parses a line of 3 letters into an empty array' do
    word = Word.new('abc')
    word.sequences.must_be_empty
  end

  it 'ignores non alpha characters' do
    word = Word.new('abcd1')
    word.sequences.must_equal ['abcd']
    word = Word.new("abcd`")
    word.sequences.must_equal ['abcd']
    word = Word.new("abcd!")
    word.sequences.must_equal ['abcd']
  end

  it 'returns groupings of 4 consecutive letters' do
    word = Word.new('abcdefgh ijkl mn`op qrst~uv wxyz')
    word.sequences.must_equal ['abcd', 'bcde', 'cdef', 'defg', 'efgh', 'ijkl', 'qrst', 'wxyz']
  end
end
