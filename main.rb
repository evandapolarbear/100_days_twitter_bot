#!/usr/bin/env ruby

require "twitter"
require_relative "./bot.rb"

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["CONSUMER_KEY_100"]
  config.consumer_secret = ENV["CONSUMER_SECRET_100"]
  config.access_token = ENV["ACCESS_TOKEN_100"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET_100"]
end

search_options = {
  result_type: "recent"
}

# def retweet(term, opts, api)
#   api.search(term, opts).take(1).each do |tweet|
#     api.retweet(tweet)
#     puts "retweeted #{tweet.user.screen_name}"
#
#   end
# end


def main(term, opts, num, api)
  liked_names = []

  api.search(term, opts).take(num).each do |tweet|
    s_name = tweet.user.screen_name

    if !liked_names.include?(s_name)
      puts s_name
      liked_names << s_name
      api.favorite(tweet)
    end
  end
  puts "#{liked_names.count} tweets favorited of #{num} searched"
end


def better_retweet(term, opts, api, num)

  bot_opts = {
    :name => "Pope Lenny, first of his Name",
    :data => "bot_talk_base"
  }

  bot = Bot.new(bot_opts)

  api.search(term, opts,).take(num).each do |tweet|
    if tweet.retweet?
      puts "stopped because tweet is retweet"
      next
    end

    message = bot.random_response(:retweets)
    name = tweet.user.screen_name
    url = tweet.url

    api.update("#{message} @#{name} RT: #{url}")

    puts "sent '#{message}' to #{name}"
  end
end


# main("100daysofcode", search_options, 50, client)
better_retweet("100daysofcode", search_options, client, 5)
