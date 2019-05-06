require 'sinatra'
require 'sinatra/contrib' ## reload located here

require 'pg'
require './app'

use Rack::MethodOverride


run App

# run Rack::Cascade.new([
#   App,
#   TeamController,
#   PlayerController,
#
# ])
