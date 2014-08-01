
require 'nokogiri'
require 'mailgun'
require_relative "email.rb"
require_relative "match_schedules.rb"

task :send_matches do
  matches = Matchdata.new
  email = Email.new
  email.send_email(matches.get_all_matches)
end

