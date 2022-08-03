class AddCampsitesToCampgrounds < ActiveRecord::Migration[7.0]
  def change
    add_reference :campsites, :campground, foreign_key: true

    add_reference :campgrounds, :campsite, foreign_key: true, has_many: true
  end
end
