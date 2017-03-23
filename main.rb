#!/usr/bin/env ruby

require "twitter"
require_relative "./bot.rb"

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["CONSUMER_KEY_100"]
  config.consumer_secret = ENV["CONSUMER_SECRET_100"]
  config.access_token = ENV["ACCESS_TOKEN_100"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET_100"]
end

SEARCH_OPTIONS = {
  result_type: "recent"
}

def favorite(term, opts, num, api)
  liked_names = []

  api.search(term, opts).take(num).each do |tweet|
    s_name = tweet.user.screen_name

    if !liked_names.include?(s_name)
      puts "favorited: " + s_name

      liked_names << s_name
      api.favorite(tweet)
    end
  end
end

def better_retweet(term, opts, api, num)

  bot_opts = {
    :data => "bot_talk_base"
  }

  bot = Bot.new(bot_opts)

  api.search(term, opts).take(num).each do |tweet|
    next if tweet.retweet?

    message = bot.random_response(:retweets)
    name = tweet.user.screen_name
    url = tweet.url

    api.update("#{message} @#{name} RT: #{url}")

    puts "sent '#{message}' to #{name}"
  end
end


def listen_for_mentions(term, opts, api, time)
  f = File.open("last_mention_id.txt", "r")
  last_id = f.read.to_i
  f.close

  while true
    api.search(term, opts).take(5).each do |tweet|
      id =  tweet.id

      if id > last_id
        last_id = id
        f2 = File.open("last_mention_id.txt", "w")
        f2.write("#{id}")
        f2.close

        reply_with_response(tweet, api, id)
      end
    end
    sleep(time)
  end
end

def reply_with_response(tweet, api, id)
  username = tweet.user.screen_name

  filtered_text = remove_mentions(tweet.text)
  response = create_bot_response(filtered_text)

  api.update("@#{username} #{response}",  in_reply_to_status_id: id)
end

def remove_mentions(text)
  text.split(" ").select{|w| w[0] != "@"}.join(" ")
end

def create_bot_response(text)
  bot = Bot.new(:data => 'bot_talk_base')
  bot.response_to(text)
end




def main(opts, clt)
  twt_time = 60 * 60 * 12
  fav_time = 60 * 60 * 8

  t = Thread.new do
    async_fav(opts, clt, fav_time)
  end

  u = Thread.new do
    async_tweet(opts, clt, twt_time)
  end

  v = Thread.new do
    listen_for_mentions("@100daysbot", opts, clt, 5)
  end

  t.join
  u.join
  v.join

end

def async_fav(opts, clt, time)
  while true
    favorite("#100daysofcode", opts, 50, clt)
    sleep time
  end
end

def async_tweet(opts, clt, time)
  while true
    better_retweet("#100daysofcode", opts, clt, 10)
    sleep time
  end
end




# main(SEARCH_OPTIONS, client)




# method_checker("#100daysofcode", SEARCH_OPTIONS, client)

# favorite("#100daysofcode", SEARCH_OPTIONS, 50, client)

# listen_for_mentions("@100daysbot", SEARCH_OPTIONS, client)

# better_retweet("#100daysofcode", SEARCH_OPTIONS, client, 7)
