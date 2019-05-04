require 'sinatra'
require 'sinatra/contrib' ## reload located here

require 'pg'
require './app'

# require_relative './models/post'
# require_relative './controllers/posts_controller'

run App

# run Rack::Cascade.new([
#   App,
#   TeamController,
#   PlayerController,
#
# ])
