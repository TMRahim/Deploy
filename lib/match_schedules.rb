require 'nokogiri'
require 'open-uri'
require 'pry'


class Weather

   def initialize(weather_site)
     site_html = open(weather_site)
     @weather_team = Nokogiri::HTML(site_html)
  end
  def weather_info
    @weather_team.css("p.wx-temp").children.first.text
  end
  def rain_change 
    @weather_team.css("div.wx-details").first.children.children.children[1].text    
  end
end
  
class MlbTeam

  def initialize(team_website)
    team_html = open(team_website)
    @team = Nokogiri::HTML(team_html)
  end

  def mlb_against
    @team.css('#my-teams-table div.span-4 div:nth-child(1) div.span-2 div div div div.overview div.team.team-home div.record h6').text
  end

  def next_game
    "The next game for #{team_name} is " + @team.css("div.mod-container.mod-game.current h4").text + " " +"against" + " " + mlb_against
  end

  def team_name
    @team.css('#sub-branding h1 a b').text
  end

end

 
class NFLTeam
  def initialize (nfl_team_website)
    nfl_team_html = open(nfl_team_website)
    @nfl_team = Nokogiri::HTML(nfl_team_html)
    
  end
  def nfl_against 
    @nfl_team.css('#my-teams-table div.span-4 div:nth-child(1) div.span-2 div div div div.overview div.team.team-away div h6').text
    
  end

  def nfl_next_game
    "The next game for #{nfl_team_name} is " + @nfl_team.css(".bg-opaque#my-teams-table .mod-container .span-2 .mod-no-footer h4").text + " " + "against" + " "+ nfl_against
  end

  def nfl_team_name 
    @nfl_team.css('#sub-branding h1 a b').text
  end
end 



class SoccerTeam

  def initialize(soccer_site)
    soccer_team_html = open(soccer_site)
    @team_doc = Nokogiri::HTML(soccer_team_html)   

  end

  def date
    @team_doc.css('div.team-hdr-item.team-hdr-next h4 span.team-hdr-time').text
  end
  def time
    @team_doc.css('div.team-hdr-item.team-hdr-next table tbody tr td.center a').text
  end

  def against
    opponent = ""
    team1 = @team_doc.css('div.team-hdr-item.team-hdr-next table tbody tr td:nth-child(1)').text
    team2 = @team_doc.css('div.team-hdr-item.team-hdr-next table tbody tr td.txtright').text
    if soccer_team_name == team1 
      opponent = team2
    elsif soccer_team_name == team2
      opponent = team1
    end
    opponent
  end

  def next_game
    "The next game for #{soccer_team_name} is on #{time}, #{date} against #{against}" 
  end

  def soccer_team_name 
      @team_doc.css('div.page-header h1 a abbr span').text
  end

end

class Matchdata
  def get_all_matches
    barcelona = SoccerTeam.new("http://www1.skysports.com/football/teams/barcelona/fixtures-results")
    giants = NFLTeam.new('http://espn.go.com/nfl/team/_/name/nyg/new-york-giants')
    yankees = MlbTeam.new('http://espn.go.com/mlb/team/_/name/nyy/new-york-yankees')
    test_weather = Weather.new("http://www.weather.com/weather/tenday/New+York+NY+USNY0996")
    "#{barcelona.next_game} \n #{giants.nfl_next_game } \n #{yankees.next_game}.\n Today weather is #{test_weather.weather_info}F. The chance of raining is #{test_weather.rain_change}."
  end
end



