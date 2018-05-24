json.extract! @post, :id, :caption
json.url post_url(@post, format: :json)
json.image @post.image.url
json.user @post.user.username
