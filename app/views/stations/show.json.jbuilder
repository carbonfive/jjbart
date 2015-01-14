json.stations do
json.name @stations.name
json.short_name @stations.abbr
json.latitude @stations.gtfs_latitude
json.longitude @stations.gtfs_longitude
json.(@stations, :address, :city, :state, :zipcode, :county)
end
