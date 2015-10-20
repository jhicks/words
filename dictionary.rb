require_relative 'word'

class Dictionary
  Entry = Struct.new(:sequence, :word)

  attr_reader :entries

  def initialize(io)
    results = Hash.new { |hash, key| hash[key] = [] }

    words(io) do |word|
      word.sequences.each do |sequence|
        results[sequence] << word.value
      end
    end

    results.select! { |k,v| v.length == 1 }

    @entries = results.collect { |entry| Entry.new(entry[0], entry[1][0]) }
    @entries.sort_by! { |entry| entry.sequence }
  end

  private

  def words(io)
    io.each_line do |line|
      yield Word.new(line)
    end
  end
end
