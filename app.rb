require 'sinatra'

get "/" do
  @title = "Calendriers"
  erb :index
end