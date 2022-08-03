# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_03_165209) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campgrounds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campsite_id"
    t.index ["campsite_id"], name: "index_campgrounds_on_campsite_id"
  end

  create_table "campsites", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.date "booked_dates", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campground_id"
    t.index ["campground_id"], name: "index_campsites_on_campground_id"
    t.index ["price"], name: "index_campsites_on_price"
  end

  add_foreign_key "campgrounds", "campsites"
  add_foreign_key "campsites", "campgrounds"
end
