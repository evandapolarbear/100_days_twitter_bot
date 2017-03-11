require 'yaml'

bot_data = {
  :presubs => [
    ["dont"   : "don't"],
    ["youre"  : "you're"],
    ["love"   : "like"],
    ["hi"     : "hello"],
    ["hola"   : "hello"],
    ["hey"    : "hello"],
    ["thanks" : "thank you"]
  ],
  :responses => {
    :default => ["hrrrmmmm?",
                 "Sorry, I dont understand.", "Wut?"],

    :greeting => ["Hola",
                  "Heya [name], hows it going?"],

    :retweets => ["You go Glen CoCo",
                  "Don't STOP, Believing",
                  "Preach!"]

    'i like *' => ["I like * too!",
                   "Why do you like * so much?",
                   "* is so cool"]

    "thank you" => ["You're welcome",
                    "De Nada",
                    "All in a days work for superbot"]
  }
}
