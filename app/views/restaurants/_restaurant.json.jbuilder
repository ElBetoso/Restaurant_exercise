json.extract! restaurant, :id, :Name, :Description, :Address, :Phone, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
