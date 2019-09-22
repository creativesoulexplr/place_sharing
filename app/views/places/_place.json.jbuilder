json.extract! place, :id, :lat, :lng, :user_id, :title, :details, :full_address, :created_at, :updated_at
json.url place_url(place, format: :json)
