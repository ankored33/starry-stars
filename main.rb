require 'sinatra'
require 'sinatra/reloader'
require 'uri'
require 'json'
require 'net/http'

get "/" do
  stars = Stars.new("https://anond.hatelabo.jp/20171019123120")
  stars.parseJsonToHash
  @num = stars.nomal_stars.length
  erb :index
end

class Stars
  def initialize(url = "")
    @url = url
  end

  def parseJsonToHash
    uri = URI.parse("http://s.hatena.com/entry.json?uri=#{URI.escape(@url)}")
    json = Net::HTTP.get(uri)
    @hash = JSON.parse(json)
  end
  
  def setStars
    self.parseJsonToHash
    @nomal_stars = @hash["entries"][0]["stars"]
    @colored_stars = @hash["entries"][0]["colored_stars"]
  end

  attr_accessor :nomal_stars, :colored_stars

end



=begin
起動コマンド
bundle exec ruby main.rb -p $PORT -o $IP
=end