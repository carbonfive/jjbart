class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :abbr
      t.string :gtfs_latitude
      t.string :gtfs_longitude
      t.string :address
      t.string :county
      t.string :state
      t.string :city
      t.string :zipcode
      t.timestamps null: false
    end
  end
end
