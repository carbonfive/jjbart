# spec/controllers/arrivals_controller_spec.rb
require 'spec_helper'

describe 'GET /stations/:id', :vcr do
	context 'when a station is requested' do
		it 'returns a successful response' do
			VCR.use_cassette 'stations-mont' do
				get '/stations/mont.json'
			end
			expect(last_response).to be_ok
			expect(last_response.body).to be_an_instance_of(String)
		end

		it 'returns the station' do
			VCR.use_cassette 'stations-mont' do
				get '/stations/mont.json'
			end

			expected = {"name" => "Montgomery St.",
				"short_name" => "MONT",
				"latitude" => "37.789256",
				"longitude" => "-122.401407",
				"address" => "598 Market Street",
				"city" => "San Francisco",
				"state" => "CA",
				"zipcode" => "94104",
				"county" => "sanfrancisco"}
				
				parsed_response = JSON.parse(last_response.body)

				expect(parsed_response['stations']).to eq(expected)
			end
		end
	end



describe 'GET /stations', :vcr do
	context 'when all stations are requested' do
		it 'returns a successful response' do
			VCR.use_cassette 'stations-indexreail' do
				get '/stations.json'
			end
			expect(last_response).to be_ok
			expect(last_response.body).to be_an_instance_of(String)
		end

		it 'returns 45 stations' do
			VCR.use_cassette 'stations-index' do
				get '/stations.json'
			end

			expected = {"name" => "12th St. Oakland City Center",
				"short_name" => "12TH",
				"latitude" => "37.803664",
				"longitude" => "-122.271604",
				"address" => "1245 Broadway",
				"city" => "Oakland",
				"state" => "CA",
				"zipcode" => "94612",
				"county" => "alameda"}
				
				parsed_response = JSON.parse(last_response.body)

				expect(parsed_response['stations'][0]).to eq(expected)
				expect(parsed_response['stations'].count).to be(45)
			end
		end
	end