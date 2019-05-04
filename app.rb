require "sinatra/base"
require "./controllers/homepage_controller"
require "./controllers/football_teams_controller"

require "./controllers/players_controller"

class App < Sinatra::Base
  use HomePageController
  use PlayerController
  use FootballTeamController



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
