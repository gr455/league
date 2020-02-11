#this is where you write all your routes
Rails.application.routes.draw do
  get "players" => "players#index" #says, "When there is a get request to players, do player#index"
  get "players/new"=>"players#new"
  get "players/:id"=>"players#update"
  get "teams"=> "teams#showTeams"

  post "players" => "players#create" #this is the route where you send your post request form the form to

  patch "players/:id"=>"players#doUpdate"


end
