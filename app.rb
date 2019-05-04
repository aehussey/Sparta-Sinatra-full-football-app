require "sinatra/base"

require "./controllers/players_controller"
require "./controllers/football_teams_controller"

class App < Sinatra::Base
  use PlayerController
  use FootballTeamController


  set :root, File.join(File.dirname(__FILE__), ".")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end


  get '/' do
    erb :'homepage/index'
  end



  get '/players' do

  end

  get '/teams' do

  end

end

# class Teams < Sinatra::Base
#   get "/teams" do
#     use TeamController
#   end

  # use PlayerController




# class PlayersApp < App
#   use PlayerController
#
#   get '/players' do
#
#   end
#
# end
