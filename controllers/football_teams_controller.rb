require_relative '../models/football_team/football'
class FootballTeamController < Sinatra::Base



  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end


  get "/teams" do

    @teams = Football.all

    erb :'football_teams/index'

  end

  get "/teams/new" do
    @teams = Football.new

    erb :'football_teams/new'
  end

  post "/teams/" do

    team = Football.new

    team.name = params[:name]
    team.points = params[:points]
    team.position = params[:position]
    team.image = params[:image]


    #Save the post to the database

    team.save

    redirect '/teams'

  end

  get "/teams/:id" do
    id = params[:id].to_i
    @teams = Football.find(id)
    @players = Football.players(id)


    erb  :'football_teams/show'
  end

  get "/teams/:id/edit" do
    id = params[:id].to_i
    @teams = Football.find(id)
    erb :'football_teams/edit'
  end



  put "/teams/:id" do

    id = params[:id].to_i

    team = Football.find(id)

    team.name = params[:name]
    team.points = params[:points]
    team.position = params[:position]
    team.image = params[:image]

    team.save

    redirect '/teams'

  end

  delete "/teams/:id" do

    id = params[:id].to_i

    Football.destroy(id)

    redirect '/teams'
  end

end
