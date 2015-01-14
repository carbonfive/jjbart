# spec/controllers/arrivals_controller_spec.rb
require 'spec_helper'

describe 'GET #arrivals', :vcr do
	context 'when arrivals is requested' do
		it 'returns a successful response' do
			VCR.use_cassette 'arrivals-mont' do
				get '/arrivals/mont.json'
			end
			expect(last_response).to be_ok
			expect(last_response.body).to be_an_instance_of(String)
		end

		it 'returns the station and arrivals' do
			VCR.use_cassette 'arrivals-mont' do
				get '/arrivals/mont.json'
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

				expect(parsed_response['station']).to eq(expected)
				expect(parsed_response['arrivals']).to_not be_empty

			end
			it 'returns a 404 if the requested station is unknown' do
			VCR.use_cassette 'arrivals-bad' do
				get '/arrivals/bad.json'
			end				
				expect(last_response).to be_not_found
			end
		end
	end
