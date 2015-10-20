class Word
  attr_reader :value

  def initialize(value)
    @value = value.strip
  end

  def sequences
    @sequences ||= parse
  end

  private

  def parse
    sections.flat_map do |section|
      section.chars.each_cons(4).map(&:join)
    end
  end

  def sections
    @value.scan(/[a-zA-Z]{4,}/)
  end
end

