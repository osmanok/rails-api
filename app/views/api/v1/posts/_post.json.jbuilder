json.extract! post, :id, :user_id, :title, :body, :visible, :vote, :created_at, :updated_at
json.url api_v1_post_url(post, format: :json)
