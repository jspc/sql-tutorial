#!/usr/bin/env ruby
#
# Fill our database with stuff

require 'mysql2'
require 'csv'
require 'date'

max = ENV['RUNS'] || 500000
db  = Mysql2::Client.new(:host => "localhost", :username => ENV['SQL_USER'], :password => ENV['SQL_PW]', :database => "our_game_company")

sexes       = ['M', 'F', 'N']
clean_words = File.open( File.join(File.dirname(__FILE__), 'csv/words.txt' ), 'r' ).readlines
swear_words = File.open( File.join(File.dirname(__FILE__),'csv/swear.txt'), 'r' ).readlines
countries   = []
cities      = []
games       = []
domains     = %w{hotmail outlook gmail yahoo webmail mail domain}

CSV.read( File.join(File.dirname(__FILE__), 'csv/countrylist.csv' ), { :headers => true, :encoding => 'windows-1251:utf-8' } ).each { |c| countries << c["Common Name"] }
CSV.read( File.join(File.dirname(__FILE__), 'csv/cities.csv' ) ).each { |c| cities << c[2] }

db.query( "SELECT game FROM games" ).each { |g| games << g['game'] }

max.to_i.times do |count|
  puts "Adding user #{count} of #{max}"

  username  = "#{clean_words.sample.chomp}_#{swear_words.sample.chomp}-#{rand 20}".gsub(/\s+/, "")
  city      = cities.sample
  country   = countries.sample
  sex       = sexes.sample
  email     = "#{username.chomp}@#{domains.sample.chomp}.com"
  signup    = Time.now.strftime "%Y-%m-%d %H:%M:%S"      #YYYY-MM-DD HH:MM:SS

  begin
    new_user = "INSERT INTO users VALUES ( '#{username}', '#{city}', '#{country}', '#{sex}', '#{email}', '#{signup}' )"
    db.query new_user
    
    rand(games.length).times do
      game  = games.sample
      score = rand(50000)
      
      new_score = "INSERT INTO games_users VALUES ( '#{username}', '#{game}', '#{score}' )"
      db.query new_score
    end
  rescue
    next
  end
end
