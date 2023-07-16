json.extract! story, :id, :story_id, :title, :text, :created_at, :updated_at
json.url story_url(story, format: :json)
