require_relative 'dictionary'

dictionary = nil
File.open('dictionary.txt', 'r') do |f|
  dictionary = Dictionary.new(f)
end

begin
  sequences_file = File.open('sequences', 'w')
  words_file = File.open('words', 'w')
  dictionary.entries.each do |entry|
    sequences_file.puts entry.sequence
    words_file.puts entry.word
  end
ensure
  sequences_file.close if sequences_file && !sequences_file.closed? rescue nil
  words_file.close if words_file && !words_file.closed? rescue nil
end

