#Twitter Bot for #100daysofcode

This is a twitter bot designed to favorite and retweet tweets that use the hash tag "100daysofcode." It also replies when mentioned in tweets.

##Implementation
To create this bot I used the Ruby's twitter Gem.  The twitter gem made it easy to search for tweets and create tweets.  To keep this bot running and tweeting at specified times, I uploaded it to a Raspberry Pi which runs the script continuously.  For each of the bots functions favoriting, retweeting, and listening for mentions, I created a new ruby thread and then joined them in a main function that is called when the script runs.  Each of these 3 functions runs in an infinite loop with a sleep value pauses it for a given number of hours.

For the retweet comments and replies to mentions, I created a simple chatter bot.  This bot takes in an input corrects its spelling, and then switches out any word that it can with a word that the bot is programmed to understand.  For example any input that contains "... sister ..." is subbed to "... family ..."; any input that contains "I don't like..." will be subbed to "I dislike ...".  After the input is subbed, the bot goes through the new input and looks for strings that has a it has been programmed to respond to.  Some of these "hot words" disregard the rest of the string and some actually will chop the rest of the input and use it in the response.  Once a hot word is found the bot picks a random response from the corresponding responses, and if appropriate adds in the rest of the input. 
