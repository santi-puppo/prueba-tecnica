class CreateCampgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.text :price_range

      t.timestamps
    end
  end
end
