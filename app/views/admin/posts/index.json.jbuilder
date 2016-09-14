json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :category_id, :user_id
  json.url post_url(post, format: :json)
end
