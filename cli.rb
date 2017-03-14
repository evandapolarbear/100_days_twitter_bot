#!/usr/bin/env ruby
require_relative './bot'

bot = Bot.new(:name => "Lenny", :data => "bot_talk_base")

puts ">> " + bot.greeting

while input = gets and input.chomp != "bye"
  puts ">> " + bot.response_to(input)
end

puts ">> " +  bot.farewell
