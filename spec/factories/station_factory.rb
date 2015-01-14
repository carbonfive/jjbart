FactoryGirl.define do
  factory :station do
    name "Fake Montgomery St."
	abbr "MONT"
    gtfs_latitude "37.789256"
	gtfs_longitude "-122.401407"
	address "598 Market Street"
	city "San Francisco"
	state "CA"
	zipcode "94104"
	county "sanfrancisco"
  end
end