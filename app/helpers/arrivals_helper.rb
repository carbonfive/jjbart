module ArrivalsHelper
	def process_arrivals(rawArrivals)
		# time is currently unused, but is intended for use in eta calculation
		#time = create_timestring(rawArrivals['date'], rawArrivals['time'])
		create_arrivals_list rawArrivals['station']['etd']
	end

	def create_timestring(date, time)
		t_string = "#{date} #{time}"
		format = "%m/%d/%Y %I:%M:%S %P %Z"
		DateTime.strptime(t_string, format).utc
	end

	def create_arrival(rawArrival)
		arrivals = Array.new
		destination = Station.find_by(abbr: rawArrival['abbreviation'].upcase)

		if !rawArrival['estimate'].kind_of?(Array)
			rawArrival['estimate'] = [rawArrival['estimate']] # Force to array when only a single object
		end

		rawArrival['estimate'].each { |rawEstimate|
			arrivals << Arrival.new(rawEstimate, destination)
		}

		return arrivals
	end

	def create_arrivals_list(rawArrivals)
		newArrivals = Array.new
		rawArrivals.each {|arrival| newArrivals << create_arrival(arrival)}

		newArrivals.flatten!
		newArrivals.sort!{|a, b| a.minutes <=> b.minutes}
	end
end