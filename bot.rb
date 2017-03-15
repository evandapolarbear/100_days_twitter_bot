#!/usr/bin/env ruby

require 'yaml'
require_relative 'lang_fun/wordplay.rb'

class Bot
  attr_reader :name, :data

  def initialize(opts)
    @name = opts[:name] || "Lars"

    begin
      @data = YAML.load(File.read(opts[:data]))
    rescue
      raise "#{@name} can't load it's brain!"
    end
  end

  def greeting
    random_response :greeting
  end

  def farewell
    random_response   :farewell
  end

  def response_to(input)

    #itterates through every presub and subs it
    #so to make is simpler for bot to respond.
    prepped_input = preprocess(input)

    sentence = best_sentence(prepped_input)


    responses = possible_responses(sentence)
    responses[rand(responses.length)]
  end

  def random_response(key)
    rand_idx = rand(@data[:responses][key].length)
    @data[:responses][key][rand_idx].gsub(/\[name\]/, @name)
  end

  private

  def possible_responses(sentence)
    responses = []

    @data[:responses].keys.each do |pattern|
      #?
      next unless pattern.is_a?(String)

      if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
        if pattern.include?("*")
          responses << @data[:responses][pattern].collect do |phrase|
           matching_section = sentence.sub(/^.*#{pattern}\s+/, '')
           phrase.sub('*', WordPlay.switch_pronouns(matching_section))
          end
        else
          responses << @data[:responses][pattern]
        end
      end
    end

    responses << @data[:responses][:default] if responses.empty?
    responses.flatten
  end

  def preprocess(input)
    #add curse removal before live

    lowered = input.downcase
    # lowered = WordPlay.remove_curses()
    perform_substitutions(lowered)
  end

  def perform_substitutions(input)
    @data[:presubs].each{ |s| input.gsub!(s[0], s[1])}
    input
  end

  def best_sentence(input)
    hot_words = @data[:responses].keys.select do |key|
      key.class == String && key = ~/^\w+$/
    end

    WordPlay.best_sentence(input.sentences, hot_words)
  end
end
