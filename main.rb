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
uri = URI.parse("http://s.hatena.com/entry.json?uri=#{URI.escape(url)}")
json = Net::HTTP.get(uri)
nomal_stars = JSON.parse(json)["entries"][0]["stars"]
colored_stars = JSON.parse(json)["entries"][0]["colored_stars"]
puts nomal_stars
p "end"


=begin
起動コマンド
bundle exec ruby main.rb -p $PORT -o $IP
=end