require 'sinatra'
require 'sinatra/reloader'
require 'uri'
require 'json'
require 'net/http'

get "/" do
  @num = 100

  erb :index
end

url = "https://anond.hatelabo.jp/20171019123120"

class Stars
  def initialize(url)
    @url = url
  end

  def parseJsonToHash
    uri = URI.parse("http://s.hatena.com/entry.json?uri=#{URI.escape(@url)}")
    json = Net::HTTP.get(uri)
    hash = JSON.parse(json)
    puts hash
    @nomal_stars = hash["entries"][0]["stars"]
    @colored_stars = hash["entries"][0]["colored_stars"]    
  end

  attr_accessor :nomal_stars, :colored_stars

end

stars = Stars.new("https://anond.hatelabo.jp/20171019123120")
stars.parseJsonToHash
p stars.nomal_stars

=begin
起動コマンド
bundle exec ruby main.rb -p $PORT -o $IP
=end