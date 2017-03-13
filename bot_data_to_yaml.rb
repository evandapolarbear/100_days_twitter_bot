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

    ["thanks" , "thank you"],
    ["gracias" , "thank you"],

    ["love" , "like"],
    ["enjoy" , "like"],

    ["dislike", "hate"],
    ["despise", "hate"],
    ["dont like", "hate"],
    ["don't like", "hate"],

    ["yeah", "yes"],
    ["ya", "yes"],
    ["yup", "yes"],

    ["mom", "family"],
    ["dad", "family"],
    ["sister", "family"],
    ["brother", "family"],
  ],

  :responses => {
    :default => ["hrrrmmmm?",
                 "Sorry, I dont understand.",
                 "Wut?",
                 "Tell me something else"],

    :greeting => ["Hola",
                  "Hi I'm [name], hows it going?",
                  "Whats up?"],

    :farewell => ["See Ya!",
                  "Adios!",
                  "Farewell!",
                  "Good bye!",
                  "Au revoir!"],

    :retweets => ["You go Glen CoCo",
                  "Don't STOP, Believing",
                  "Preach!"],

    'sorry' => ["No need to appoligize!",
                "It's Okay"],

    'different' => ["What changed?",
                    "How is it different"],

    'everyone *' => ["You think everyone *?"],

    'do not know' => ["Why can't you decide?"],

    'yes' => ["Coolio!",
              "Great!"],

    'no' => ["Really?",
             "Okay.",
             "Fair enough."]

    'you are *' => ["What makes you think I'm *",
                    "Are you so sure I am *"],

    'you are *' => ["Did you mean that a nice way",
                    "Are you sure I'm *?",
                    "I think I'd enjoy being *."],

    'i am *' => ["Do you like being *?",
                 "How did you become *?",
                 "Is it normal to be *?"] ,

    'i do not *' => ["Why don't you *",
                     "Cool me either"],



    'family' => ["Tell me about your family"],

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
