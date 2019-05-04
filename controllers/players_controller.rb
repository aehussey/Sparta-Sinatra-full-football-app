class PlayerController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $teams = [{
    id: 0,
    name: "Jonjo",
    points: 92,
    position: "1st",
    image: "https://picsum.photos/200"

    },
    {
    id: 1,
    name: "CHO",
    points: 91,
    position: "2nd",
    image: "https://picsum.photos/200"

    },
    {
    id: 2,
    name: "RLC",
    points: 71,
    position: "3rd",
    image: "https://picsum.photos/200"

    },
    {
    id: 3,
    name: "JT",
    points: 70,
    position: "4th",
    image: "https://picsum.photos/200"
    }]


  get "/players" do

    @teams = $teams

    erb :'players/index'

  end

  get "/players/new" do
    @teams = {
      id: "",
      name: "",
      points: "",
      position: "",
      image: ""

    }

    erb :'players/new'
  end

  get "/players/:id" do
    id = params[:id].to_i
    @teams = $teams[id]
    erb :'players/show'
  end

  get "/players/:id/edit" do
    id = params[:id].to_i

    @teams = $teams[id]
    erb :'players/edit'
  end

  post "/players/" do
    new_team = {
    id: $teams.length,
    name: params[:name],
    points: params[:points],
    position: params[:position]}

    $teams.push(new_team)

    redirect '/players/'

  end

  put "/players/:id" do
    id = params[:id].to_i

    $teams[id][:name] = params[:name]
    $teams[id][:points] = params[:points]
    $teams[id][:position] = params[:position]

    redirect '/players/'
  end

  delete "/players/:id" do

    id = params[:id].to_i

    $teams.delete_at(id)

    redirect '/players/'
  end

end
