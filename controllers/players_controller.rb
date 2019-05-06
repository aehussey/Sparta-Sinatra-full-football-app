require_relative '../models/player/player'


class PlayerController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # $players = [{
  #   id: 0,
  #   name: "Jonjo",
  #   points: 92,
  #   position: "1st",
  #   image: "https://picsum.photos/200"
  #
  #   },
  #   {
  #   id: 1,
  #   name: "CHO",
  #   points: 91,
  #   position: "2nd",
  #   image: "https://picsum.photos/200"
  #
  #   },
  #   {
  #   id: 2,
  #   name: "RLC",
  #   points: 71,
  #   position: "3rd",
  #   image: "https://picsum.photos/200"
  #
  #   },
  #   {
  #   id: 3,
  #   name: "JT",
  #   points: 70,
  #   position: "4th",
  #   image: "https://picsum.photos/200"
  #   }]


  get "/players" do

    @players = Player.all

    erb :'players/index'

  end

  get "/players/new" do
    @players = Player.new

    erb :'players/new'
  end

  get "/players/:id" do
    id = params[:id].to_i
    @players = Player.find(id)
    puts @players.first_name
    puts  @players.last_name
    @team = Player.team(@players.first_name, @players.last_name)

    erb  :'players/show'
  end

  get "/players/:id/edit" do
    id = params[:id].to_i
    @players = Player.find(id)
    erb :'players/edit'
  end

  post "/players" do
    player = Player.new

    player.first_name = params[:first_name]
    player.last_name = params[:last_name]
    player.age = params[:age]
    player.position = params[:position]
    player.team_id = params[:team_id]
    player.image = params[:image]

    #Save the post to the database

    player.save

    redirect '/players'

  end

  put "/players/:id" do

    id = params[:id].to_i

    team = Player.find(id)

    player.first_name = params[:first_name]
    player.last_name = params[:last_name]
    player.age = params[:age]
    player.position = params[:position]
    player.team_id = params[:team_id]
    player.image = params[:image]

    team.save

    redirect '/players'

  end

  delete "/players/:id" do

    id = params[:id].to_i

    Player.destroy(id)

    redirect '/players'
  end
end
