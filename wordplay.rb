class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s*|\!\s*|\?\s*/)
  end

  def words
    scan(/\w[\w\'\-]*/)
  end
end

class WordPlay
  def self.hot_words(string, words)
    string.sentences.find_all do |s|
      s.downcase.words.any? do |w|
        words.include?(w)
      end
    end
  end

  def self.switch_pronouns(string)
    string.gsub(/\b(I am|You are|I|You|Your|My)\b/i) do |pronoun|
      case pronoun.downcase
        when "i"
          "you"
        when "you"
          "I"
        when "i am"
          "you are"
        when "your"
          "my"
        when "my"
          "your"
      end
    end.sub(/^me\b/i, 'i')
  end


  def self.best_sentence(sentences, words)
    ordered = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - words).length
    end
    ordered.last
  end
end

hotties = %w{ruby javascript html css}
test_string = "ruby ruby. hello. ruby javascript html css. html"


# p String.best_sentence(test_string.sentences, hotties)
# p String.switch_pronouns(test_string)
# puts String.hot_words(test_string, hotties)
