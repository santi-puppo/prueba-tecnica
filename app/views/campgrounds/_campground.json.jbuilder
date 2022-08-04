json.extract! campground, :id, :name, :price_range, :booked_dates, :created_at, :updated_at
json.url campground_url(campground, format: :json)
json.campsites(campground.campsites, partial: 'campsites/campsite', as: :campsite)
