json.extract! post, :id, :title, :situation, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
