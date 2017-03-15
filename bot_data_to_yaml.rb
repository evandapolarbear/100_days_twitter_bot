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

    ["hows it going", "whats up"],
    ["what are you", "whats up"],
    ["how are you", "whats up"],
    ["como estas", "whats up"],

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
                  "Whats up?",
                  "Hey you.",
                  "Whats cracking"],

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
                  "Just keep swimming, just keep swimming.",
                  "It's a beautiful day in the neighborhood.",
                  "High Five!",
                  "Winner Winner Chicken Dinner"],




    'hello' => ["Its nice to meet you. Whats up?",
                "Hi... erm you. What's happening?",
                "Hola",
                "Whats up?",
                "Oh Hello!"],

    'whats up' => ["Nothing. Whats up with you?",
                   "Who's asking?",
                   "Nothing but its a beautiful day here in the machine",
                   "Chillaxing",
                   "nada y tu",
                   "Just Finishing up SkyNet... I mean nothing what's up with you"],

    'whats your name' => ["My name is Who? My name is what? I dont actually know."],

    'i said' => ["Cool cool cool cool cooooool",
                 "I heard whay you said I just don't care"],




    'why' => ["why not?",
              "I'm not good with existential questions but sure why not",
              "Ours is not to wonder why, or whatever"],

    'how' => ["Im not real good with the how.",
              "Yo no se",
              "How you think?",
              "Somehow..."],

    'where' => ["To the Cloud!",
                "I don't know maybe Al Gores front yard?",
                "Somewhere..."],

    'when' => ["I am eternal",
               "Definetly yesterday, or mayve tomarrow",
               "Someday..."],



    'sorry' => ["No need to appoligize!",
                "It's Okay",
                "Its already forgotten."],

    'different' => ["What changed?",
                    "How is it different"],

    'everyone *' => ["You think everyone *?"],

    'do not know' => ["Why can't you decide?"],




    'yes' => ["Coolio!",
              "Great!",
              "Awesome!",
              "Rad!",
              "Good to Hear!"],

    'no' => ["Really?",
             "Okay.",
             "Fair enough."],

    'what' => ["Why do you ask?",
               "Why?",
               "I don't know, do you?"],

    'you *' => ["What makes you think I'm *",
                    "Are you so sure I *",
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




    'i like *' => ["I like *too!",
                   "Why do you like *so much?",
                   "*is so cool"],

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
