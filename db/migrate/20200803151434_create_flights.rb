class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :number
      t.string :departure
      t.string :arrival
      t.time :time
      t.date :date
      t.references :airline, foreign_key: true
    end
  end
end
