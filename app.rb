require "sinatra/base"
require "./controllers/homepage_controller"
require "./controllers/football_teams_controller"
require "./controllers/cricket_teams_controller"
require "./controllers/players_controller"




class App < Sinatra::Base
  use HomePageController
  use PlayerController
  use FootballTeamController
  use CricketTeamController


end
