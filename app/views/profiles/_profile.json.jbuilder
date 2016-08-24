json.extract! profile, :id, :author_id, :name, :description, :created_at, :updated_at
json.url profile_url(profile, format: :json)