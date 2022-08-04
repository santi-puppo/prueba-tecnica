json.extract! campsite, :id, :name, :price, :booked_dates, :created_at, :updated_at
json.url campsite_url(campsite, format: :json)
