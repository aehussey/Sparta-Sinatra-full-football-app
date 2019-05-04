
class FootballTeamController < Sinatra::Base



  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $teams = [{
    id: 0,
    name: "Man City",
    points: 92,
    position: "1st",
    image: "https://picsum.photos/200"

    },
    {
    id: 1,
    name: "Liverpool",
    points: 91,
    position: "2nd",
    image: "https://picsum.photos/200"

    },
    {
    id: 2,
    name: "Spurs",
    points: 71,
    position: "3rd",
    image: "https://picsum.photos/200"

    },
    {
    id: 3,
    name: "Chelsea",
    points: 70,
    position: "4th",
    image: "https://picsum.photos/200"
    }]


  get "/teams" do

    @teams = $teams

    erb :'football_teams/index'

  end

  get "/teams/new" do
    @teams = {
      id: "",
      name: "",
      points: "",
      position: "",
      image: ""

    }

    erb :'teams/new'
  end

  get "/teams/:id" do
    id = params[:id].to_i
    @teams = $teams[id]
    erb :'teams/show'
  end

  get "/teams/:id/edit" do
    id = params[:id].to_i

    @teams = $teams[id]
    erb :'teams/edit'
  end

  post "/teams/" do
    new_team = {
    id: $teams.length,
    name: params[:name],
    points: params[:points],
    position: params[:position]}

    $teams.push(new_team)

    redirect '/teams/'

  end

  put "/teams/:id" do
    id = params[:id].to_i

    $teams[id][:name] = params[:name]
    $teams[id][:points] = params[:points]
    $teams[id][:position] = params[:position]

    redirect '/teams/'
  end

  delete "/teams/:id" do

    id = params[:id].to_i

    $teams.delete_at(id)

    redirect '/teams/'
  end

end
