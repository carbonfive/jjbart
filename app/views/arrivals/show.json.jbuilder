json.station do
json.name @station.name
json.short_name @station.abbr
json.latitude @station.gtfs_latitude
json.longitude @station.gtfs_longitude
json.(@station, :address, :city, :state, :zipcode, :county)
end
json.arrivals @arrivals do |a|
json.destination a.destination.name
json.short_destination a.destination.abbr
json.minutes a.minutes
json.cars a.length
json.platform a.platform
json.direction a.direction
end
