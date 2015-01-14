# lib/bart_service.rb
# Wraps the official BART API and translates the XML response to JSON 
# API Docs: http://api.bart.gov/docs/overview/index.aspx

require 'httparty'
require 'crack/xml'

class BartService
	include HTTParty
	base_uri 'http://api.bart.gov/api/'
	
	def initalize
		@api_key = 'MW9S-E7SL-26DU-VV8V'
	end

	# Configures and attempts to GET requested endpoint with selected options
	def passthrough(endpoint, options = {})
		options[:query][:key] = @api_key if options[:query][:key].nil?

		endpoint = "/#{endpoint}.aspx/"
		response = self.class.get(endpoint, options)

		response.class.module_eval { attr_accessor :parsed }
		response.parsed = Crack::XML.parse(response.body)	

		return response
	end

	def arrivals(query)
		query[:cmd] = 'etd'
		response = passthrough('etd', query: query).parsed
	end

	def get_all_stations
		response = passthrough('stn', query: {:cmd => 'stns'}).parsed
	end

end