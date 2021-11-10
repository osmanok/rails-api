json.extract! comment, :id, :post_id, :user_id, :title, :body, :approved, :created_at, :updated_at
json.url api_v1_post_comment_path(@post, comment, format: :json)
