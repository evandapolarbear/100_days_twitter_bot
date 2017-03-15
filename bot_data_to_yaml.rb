#!/usr/bin/env ruby
require 'yaml'

bot_data = {
  :presubs => [
    ["im"  , "i am"],
    ["i'm"  , "i am"],

    ["dont"   , "do not"],
    ["don't"   , "do not"],

    ["youre"  , "you're"],

    ["love"   , "like"],
    ["enjoy"   , "like"],

    ["hi"     , "hello"],
    ["hola"   , "hello"],
    ["hey"    , "hello"],


    ["thanks" , "thank you"],
    ["gracias" , "thank you"],

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
                 "Tell me something else",
                 "I didnt understand.  What are you working in today?"],

    :greeting => ["Hola",
                  "Hi I'm [name], hows it going?",
                  "Whats up?"],

    :farewell => ["See Ya!",
                  "Adios!",
                  "Farewell!",
                  "Good bye!",
                  "Au revoir!"],

    :retweets => ["You go Glen CoCo!",
                  "Don't STOP, Believingggg!",
                  "WOOP WOOP!",
                  "You're the Rocky Balboa of code.",
                  "If I had feelings I would feel in awe of you!",
                  "Just keep swimming, just keep swimming"
                  ],

    'sorry' => ["No need to appoligize!",
                "It's Okay"],

    'different' => ["What changed?",
                    "How is it different"],

    'everyone *' => ["You think everyone *?"],

    'do not know' => ["Why can't you decide?"],

    'hello' => ["Its nice to meet you. Whats up?",
                "Hi... erm you. What's happening?"],

    'yes' => ["Coolio!",
              "Great!"],

    'no' => ["Really?",
             "Okay.",
             "Fair enough."],

    'what' => ["Why do you ask?",
               "Why?",
               "I don't know, do you?"],

    'you are *' => ["What makes you think I'm *",
                    "Are you so sure I am *",
                    "Did you mean that in a nice way",
                    "Are you sure I'm *?",
                    "I think I'd enjoy being *."],

    'i am *' => ["Do you like *?",
                 "Why are you *?",
                 "Is it normal to *?",
                 "How long have you *"] ,

    'i do not *' => ["Why don't you *",
                     "Cool me either"],




    'why can\'t i *' => ["Do you want to *?"],

    'why can\,t you *' => ["Do you want me to *?"],

    'why does *' => ["I don't know why *.",
                     "Do you already know the answer."],




    'i like *' => ["I like * too!",
                   "Why do you like * so much?",
                   "* is so cool"],

    'hate *' => ["Why don't you like *?",
                 "Why the dislike of *?"],




    'family' => ["Tell me about your family"],

    "thank you" => ["De Nada",
                    "You're welcome",
                    "All in a days work for superbot"],
  }
}

puts bot_data.to_yaml
f = File.open(ARGV.first || 'bot_talk_base', "w")
f.puts bot_data.to_yaml
f.close
