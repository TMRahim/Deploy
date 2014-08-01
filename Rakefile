
require 'nokogiri'
require 'mailgun'
require_relative "lib/email.rb"
require_relative "lib/match_schedules.rb"

task :send_matches do
  matches = Matchdata.new
  email = Email.new
  email.send_email(matches.get_all_matches)
end

