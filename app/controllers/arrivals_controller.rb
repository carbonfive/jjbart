class ArrivalsController < ApiController
	include ArrivalsHelper

	def show

		@station = Station.find_by(abbr: params[:station].upcase)

		if @station
			raw = @bart.arrivals({:orig => @station.abbr})
			@arrivals = process_arrivals(raw['root'])
		else 
			respond_as_not_found
		end

	end

end