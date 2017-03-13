#!/usr/bin/env ruby

require 'yaml'
require_relative './wordplay.rb'

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
    prepped_input = preprocess(input)
    sentence = best_sentence(prepped_input)
    responses = possible_responses(sentence)
    responses[rand(responses.length)]
  end

  private

  def possible_responses(sentence)
    responses = []

    @data[:responses].keys.each do |pattern|
      next unless pattern.is_a?(String)

      if sentence.match('\b' + pattern.gsub(/\*/, '') + '\b')
        responses << @data[:responses][pattern]
      end
    end

    responses << @data[:responses][:default] if responses.empty?

    responses.flatten
  end

  def random_response(key)
    rand_idx = rand(@data[:responses][key].length)
    @data[:responses][key][rand_idx].gsub(/\[name\]/, @name)
  end

  def preprocess(input)
    perform_substitutions(input.downcase)
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



test_options = {
  :data => 'bot_talk_base'
}

lars = Bot.new(test_options)

puts lars.response_to("bopadjf. Thank you. Thank you I like katja. Thank you
I like Katja I Like Ben")
# puts lars.greeting
# puts lars.farewell
