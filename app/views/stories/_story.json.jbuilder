json.extract! story, :id, :title, :body, :author_id, :image, :created_at, :updated_at
json.url story_url(story, format: :json)