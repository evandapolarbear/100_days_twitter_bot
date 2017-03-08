#!/usr/bin/env ruby

require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["CONSUMER_KEY_100"]
  config.consumer_secret = ENV["CONSUMER_SECRET_100"]
  config.access_token = ENV["ACCESS_TOKEN_1OO"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET_100"] 
end

search_options = {
  result_type: "recent"
}

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

# main("100daysofcode", search_options, 50, client)