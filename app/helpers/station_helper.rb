require 'bart_service'

module StationHelper

	# Used by bart:seed_stations rake task
	def request_and_save_stations
		i = 0; t_started = Time.now; elapsed = 0
		response = BartService.new.get_all_stations

		response['root']['stations']['station'].each { |pendingStation|			
			next if Station.find_by(abbr: pendingStation['abbr'])
			
			pendingStation = pendingStation.reject{|k,v| !Station.new.attributes.keys.member?(k.to_s) }

			station = Station.create pendingStation
			puts "Added #{station.name} (#{station.abbr})"
			i+=1; 
		}

		t_finished = Time.now
		elapsed = (t_finished - t_started)

		puts "FINISHED! Added #{i} stations (#{elapsed}s)"
	end
end