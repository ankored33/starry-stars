require 'sinatra'
require 'sinatra/reloader'
require 'uri'
require 'json'
require 'net/http'

get "/" do
  @num = 100

  erb :index
end

uri = URI.parse('http://s.hatena.com/entry.json?https://anond.hatelabo.jp/20171014230038')
json = Net::HTTP.get(uri)
result = JSON.parse(json)

puts result
p "end"


=begin
起動コマンド
bundle exec ruby main.rb -p $PORT -o $IP
=end