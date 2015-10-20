require 'minitest/autorun'
require 'stringio'
require_relative '../dictionary'

describe Dictionary do
  it 'builds the dictionary from an io stream' do
    words = ['arrows', 'carrots', 'give', 'me'].join("\n")
    io = StringIO.new(words)

    dict = Dictionary.new(io)

    sequences = dict.entries.collect { |entry| entry.sequence }
    sequences.must_equal ['carr', 'give', 'rots', 'rows', 'rrot', 'rrow']
    words = dict.entries.collect { |entry| entry.word }
    words.must_equal ['carrots', 'give', 'carrots', 'arrows', 'carrots', 'arrows']
  end
end
