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
  @annonces = response.body["result"]
  @array_d_annonce = []
  @annonces.each do |annonce|
  @array_d_annonce << Annonce.new(annonce["photos"][0]["small"],
  	 								annonce["location"]["city"],
  	 								annonce["price"]["nightly"],
  	 								annonce["provider"]["url"], 
  	 								annonce["occupancy"])
  end
  erb :index
end
class Annonce
	def initialize(photo, ville, prix, url, capacite)
		@photo = photo
		@ville = ville
		@prix = prix
		@url = url
		@capacite = capacite
	end
	def photo
		@photo
	end
	def ville
		@ville
	end	
	def prix
		@prix
	end	
	def url
		@url
	end	
	def capacite
		@capacite
	end
end
