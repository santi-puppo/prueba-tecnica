class CreateCampsites < ActiveRecord::Migration[7.0]
  def change
    create_table :campsites do |t|
      t.string :name
      t.float :price, index: true
      t.date :booked_dates, array: true, default: []

      t.timestamps
    end
  end
end
