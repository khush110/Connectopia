json.extract! person, :id, :first_name, :last_name, :email, :phone, :instagram, :created_at, :updated_at
json.url person_url(person, format: :json)
