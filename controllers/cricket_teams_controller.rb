require_relative '../models/cricket_team/cricket'
class CricketTeamController < Sinatra::Base



  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end


  get "/cricket" do

    @teams = Cricket.all

    erb :'cricket_teams/index'

  end

  get "/cricket/new" do
    @teams = Cricket.new

    erb :'cricket_teams/new'
  end

  get "/cricket/:id" do
    id = params[:id].to_i
    @teams = Cricket.find(id)

    # @post = $posts[id]
    erb  :'cricket_teams/show'
  end

  get "/cricket/:id/edit" do
    id = params[:id].to_i
    @teams = Cricket.find(id)
    puts @teams.id

    erb :'cricket_teams/edit'
  end

  post "/cricket" do
    puts "POST THIS"

    team = Cricket.new

    team.name = params[:name]
    team.points = params[:points]
    team.position = params[:position]

    #Save the post to the database

    team.save

    redirect '/cricket'

  end

  put "/cricket/:id" do
    puts "EDIT THIS"
    id = params[:id].to_i

    team = Cricket.find(id)

    team.name = params[:name]
    team.points = params[:points]
    team.position = params[:position]

    team.save

    redirect '/cricket'

  end

  delete "/cricket/:id" do

    id = params[:id].to_i

    Cricket.destroy(id)

    redirect '/cricket'
  end

end
