class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :run_number
      t.belongs_to :route, index:true
      t.belongs_to :station, index:true
      t.string :schedule
      t.time :time
    end

  end
end
