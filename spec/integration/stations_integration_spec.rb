require 'spec_helper'

# Avoid modifying these tests, they define the acceptance critera. 
#
# You can find the JSON schema expectation in /spec/support/schema/stations.json and station-stations.json
# Not sure how to read the JSON schema? Check out: http://spacetelescope.github.io/understanding-json-schema/
#
# Your JSON output should look like:
# {
#    "stations": [
#      {
#        "name": "12th St. Oakland City Center",
#        "short_name": "12TH",
#        "latitude": "37.803664",
#        "longitude": "-122.271604",
#        "address": "1245 Broadway",
#        "city": "Oakland",
#        "state": "CA",
#        "zipcode": "94612",
#        "county": "alameda"
#      },
#     { ... }
#   ]
# }

describe 'GET /stations/:id', :vcr do
  context 'when a station is requested' do
    it 'returns a single station' do

      VCR.use_cassette 'stations-mont' do
        get '/stations/mont.json'
      end

      expect(last_response).to match_response_schema("stations-station")
    end

    describe 'with unknown station' do
      it 'returns a 404' do
        VCR.use_cassette 'stations-bad' do
          get '/stations/bad.json'
        end     

        expect(last_response).to be_not_found
      end
    end
  end
end


describe 'GET /stations', :vcr do
  context 'when all stations are requested' do
    it 'returns 45 stations' do
      VCR.use_cassette 'stations-index' do
        get '/stations.json'
      end

      expect(last_response).to match_response_schema("stations")
    end
  end
end