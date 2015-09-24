class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :duration
      t.integer :from_airport_id
      t.integer :to_airport_id

      t.timestamps null: false
    end
  end
end
