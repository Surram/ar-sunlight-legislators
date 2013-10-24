require_relative '../../db/config'
require_relative 'tweet.rb'
# require 'rubygems'
require 'twitter'

class Congressperson < ActiveRecord::Base
  validates :phone, :numericality => { :only_integer => true }

  # def set_inheritance_column(value)
  #   set_inheritance_column { :title }
  # end

  def active?
    return true if self.in_office.to_s == "1"

    false
  end


  def phone=(value)
    phone_num = value.to_s.gsub(/[^0-9+]/, "")
    write_attribute(:phone, phone_num.to_i)
  end

  def get_last_ten_tweets
    Twitter.configure do |config|
      config.consumer_key = 'NzH4bI1Q7kNpeSOBk10Hw'
      config.consumer_secret = 'zZimyC0wU0DInWoVftswG6uVVcjVIAEO6mZJY3YMw'
    end

    last_ten_tweets = Twitter.user_timeline(twitter_id, :count => 10)

    last_ten_tweets.each do |tweet_data|
      tweet =Tweet.new({ :tweet_id => tweet_data.id, :text => tweet_data.text, :congressperson_id => twitter_id })
      tweet.save
    end

  end

  # def title=(value)
  #   if value == "Rep"
  #     t = "Representative"
  #   elsif value == "Sen"
  #     t = "Senator"
  #   else
  #     t = value
  #   end
  #   write_attribute(:title, t)
  # end

end