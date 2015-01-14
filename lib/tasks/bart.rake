
namespace :bart do
	desc "Makes a one time request to obtain stations and populates the stations table"
  	task :seed_stations => :environment do
  		require 'station_helper.rb'
  		include StationHelper
  		puts "Requesting Station List ..."
  		request_and_save_stations
  	end
end