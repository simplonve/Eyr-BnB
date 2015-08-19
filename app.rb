require 'sinatra'
require 'unirest'
require 'pry'
require 'json'

get "/" do
	response = Unirest.get "https://zilyo.p.mashape.com/search?isinstantbook=true&nelatitude=22.37&nelongitude=-154.48000000000002&provider=airbnb%2Chousetrip&swlatitude=18.55&swlongitude=-160.52999999999997",
  headers:{
    "X-Mashape-Key" => "dtFSGSEqxtmshQloyQuNPHBymLNSp1aN6M1jsnE1XxVJqxvxKE",
    "Accept" => "application/json"
  }
  binding.pry
  @response = JSON.parse(response)
  erb :index
end