require 'rubygems'
require 'httparty'
require 'json'
require 'sinatra'

class Slack
    include HTTParty
    base_uri 'https://hooks.slack.com'
    default_params :output => 'json'
    format :json
end


post '/' do

quotes = ["howdy","howdy!","hola","Hola!","Salut!","Hallo!","Ciao!","Ahoji!","Ni hao!","Kon'nichiwa!","Shalom!","Marhaba!","Mirëdita!"," Ahalan!", "Parev!","Goddag!","Aloha!","Namaste!","Halo!","An-nyong Ha-se-yo!", "Dzien' dobry!", "Ola!", "Bunã ziua!", "Xin chào!", "Sawubona!", "Sholem Aleychem"]

message = quotes.sample

def callout(message)
     Slack.post('/services/T024FPVD5/B031N5JJW/zzWWp3VARnweKtFgDvGHTDqu', :body => {:channel => "#testing-webhooks", :username => "Roger Marchovic", :text => message , :icon_url => "http://www.meteo.physik.uni-muenchen.de/~roger/Roger/Roger98a.jpg"}.to_json, :headers => { 'Content-Type' => 'application/json' })
end

      callout(message)
end
