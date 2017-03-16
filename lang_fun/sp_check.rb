#!/usr/bin/env ruby

def words (text)
  text.downcase.scan(/[a-z]+/)
end


def train(features)
  model = Hash.new(1)
  features.each {|f| model[f] += 1 }
  return model
end

NWORDS = train(words(File.new('./lang_fun/holmes.txt').read))
LETTERS = ("a".."z").to_a.join

def edits1(word)
  n = word.length

  deletion = (0...n).collect do |i|
    word[0...i] + word[i + 1..-1]
  end

  transposition = (0...n-1).collect do |i|
    word[0...i] + word[i + 1, 1]
    + word[i, 1] + word[i + 2..-1]
  end

  alteration = []

  n.times do |i|
    LETTERS.each_byte do |l|
      indv =  word[0...i] + l.chr + word[i + 1..-1]

      alteration << indv
    end
  end

  insertion = []

  (n + 1).times do |i|
    LETTERS.each_byte do |l|
      indv = word[0...i] + l.chr + word[i..-1]
      insertion << indv
    end
  end

  result = deletion + transposition + alteration + insertion

  result.empty? ? nil : result
end

def known_edits2(word)
  result = []

  edits1(word).each do |ed1|
    edits1(ed1).each  do |ed2|
      result << ed2 if NWORDS.has_key?(ed2)
    end
  end

  result.empty? ? nil : result
end

def known(words)
  result = words.find_all do |w|
    NWORDS.has_key?(w)
  end

  result.empty? ? nil : result
end

def correct(word)
  (known([word]) || known(edits1(word)) || known_edits2(word) ||
    [word]).max {|a,b| NWORDS[a] <=> NWORDS[b] }
end

p correct("why")
p correct("whyy")
