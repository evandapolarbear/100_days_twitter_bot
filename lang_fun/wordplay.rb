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

  def self.remove_curses(curse_words, original, replace)
    curse_words.each do |curse|
      return replace if original.include?(curse)
    end

    original
  end
end

  # def train(features)
  #   model = Hash.new(1)
  #   features.each {|f| model[f] += 1 }
  #   return model
  # end
  #
  # txt = File.new('./holms.txt', 'r').read
  # holms_words = txt.words
  #
  # NWORDS = train(File.new('holmes.txt').read.words)
  # LETTERS = ("a".."z").to_a.join
  #
  # def edits1(word)
  #   n = word.length
  #
  #   deletion = (0...n).collect do |i|
  #     word[0...i] + word[i + 1..-1]
  #   end
  #
  #   transposition = (0...n-1).collect do |i|
  #     word[0...i] + word[i + 1, 1]
  #     + word[i, 1] + word[i + 2..-1]
  #   end
  #
  #   alteration = []
  #
  #   n.times do |i|
  #     LETTERS.each_byte do |l|
  #       indv =  word[0...i] + l.chr + word[i + 1..-1]
  #
  #       alteration << indv
  #     end
  #   end
  #
  #   insertion = []
  #
  #   (n + 1).times do |i|
  #     LETTERS.each_byte do |l|
  #       indv = word[0...i] + l.chr + word[i..-1]
  #       insertion << indv
  #     end
  #   end
  #
  #   result = deletion + transposition + alteration + insertion
  #
  #   result.empty? ? nil : result
  # end
  #
  # def known_edits2(word)
  #   result = []
  #
  #   edits1(word).each do |ed1|
  #     edits1(ed1).each  do |ed2|
  #       result << ed2 if NWORDS.has_key?(ed2)
  #     end
  #   end
  #
  #   result.empty? ? nil : result
  # end
  #
  # def known(words)
  #   result = words.find_all do |w|
  #     NWORDS.has_key?(w)
  #   end
  #
  #   result.empty? ? nil : result
  # end
  #
  # def correct(word)
  #   (known([word]) || known(edits1(word)) || known_edits2(word) ||
  #     [word]).max {|a,b| NWORDS[a] <=> NWORDS[b] }
  # end
