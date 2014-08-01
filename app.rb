require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/email.rb'
require './lib/match_schedules.rb'




get '/' do
  @baseball = MlbTeam.new('http://espn.go.com/mlb/team/_/name/nyy/new-york-yankees')
  
  @football = NFLTeam.new('http://espn.go.com/nfl/team/_/name/nyg/new-york-giants')
  
  @soccer = SoccerTeam.new("http://www1.skysports.com/football/teams/barcelona/fixtures-results")


  erb :index # This tells your program to use the html associated with the index.erb file in your browser.
end

