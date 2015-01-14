class StationsController < ApiController

	def index
		@stations = Station.all
	end

	def show
		@stations = Station.find_by(abbr: params[:id].upcase)
	end

end
