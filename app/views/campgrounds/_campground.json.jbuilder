json.extract! campground, :id, :name, :price_range, :created_at, :updated_at
json.url campground_url(campground, format: :json)
