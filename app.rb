
require 'sinatra'
require 'unirest'
require 'pry'
require 'json'

get "/" do
@annonces = array_d_annonce
erb :index
end
def array_d_annonce
	array_d_annonce = []
	Annonce.fetch_annonces.each do |annonce|
		array_d_annonce << Annonce.new(annonce)
	end
	array_d_annonce
end
class Annonce
	def initialize(annonce)
		@photo = annonce["photos"][0]["medium"]
		@ville = annonce["location"]["city"]
		@prix = annonce["price"]["nightly"]
		@url = annonce["provider"]["url"]
		@capacite = annonce["occupancy"]
	end
	def self.fetch_annonces
		response = Unirest.get "https://zilyo.p.mashape.com/search?isinstantbook=true&nelatitude=45.23&nelongitude=4.66&provider=airbnb&swlatitude=44.43&swlongitude=4.00",
  		headers:{
    	"X-Mashape-Key" => "dtFSGSEqxtmshQloyQuNPHBymLNSp1aN6M1jsnE1XxVJqxvxKE",
    	"Accept" => "application/json"
  		}
  		response.body["result"]
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