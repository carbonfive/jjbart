class Station < ActiveRecord::Base
	validates :name, :presence => true
	validates :abbr, :presence => true
	validates :gtfs_latitude, :presence => true
	validates :gtfs_longitude, :presence => true
	validates :address, :presence => true
	validates :zipcode, :presence => true
	validates :city, :presence => true
	validates :county, :presence => true
end
