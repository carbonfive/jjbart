class CreateRoot < ActiveRecord::Migration
  def change
  create_table :routes_stations, id: false do |t|
      t.belongs_to :route, index: true, forign_key: :number
      t.belongs_to :station, index: true
    end

  create_table :routes, id: false, force: :cascade do |t|
    t.primary_key  :number
    t.string   :name
    t.string   :abbr
    t.string   :color
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
  end

  create_table :stations, force: :cascade do |t|
    t.string   :name
    t.string   :abbr
    t.string   :gtfs_latitude
    t.string   :gtfs_longitude
    t.string   :address
    t.string   :county
    t.string   :state
    t.string   :city
    t.string   :zipcode
    t.datetime :created_at,     null: false
    t.datetime :updated_at,     null: false
  end
  end
end
