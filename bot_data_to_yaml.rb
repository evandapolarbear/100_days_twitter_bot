#!/usr/bin/env ruby
require 'yaml'

bot_data = {
  :presubs => [
    ["dont"   , "don't"],
    ["youre"  , "you're"],
    ["love"   , "like"],
    ["hi"     , "hello"],
    ["hola"   , "hello"],
    ["hey"    , "hello"],
    ["thanks" , "thank you"]
  ],

  :responses => {
    :default => ["hrrrmmmm?",
                 "Sorry, I dont understand.", "Wut?"],

    :greeting => ["Hola",
                  "Hi I'm [name], hows it going?"],

    :farewell => ["See Ya!",
                  "Adios!",
                  "Farewell!",
                  "Good bye!"],

    :retweets => ["You go Glen CoCo",
                  "Don't STOP, Believing",
                  "Preach!"],

    'i like *' => ["I like * too!",
                   "Why do you like * so much?",
                   "* is so cool"],

    "thank you" => ["De Nada",
                    "You're welcome",
                    "All in a days work for superbot"],
  }
}

puts bot_data.to_yaml
f = File.open(ARGV.first || 'bot_talk_base', "w")
f.puts bot_data.to_yaml
f.close
