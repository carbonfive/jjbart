json.stations @stations do |station|
json.name station.name
json.short_name station.abbr
json.latitude station.gtfs_latitude
json.longitude station.gtfs_longitude
json.(station, :address, :city, :state, :zipcode, :county)
end
