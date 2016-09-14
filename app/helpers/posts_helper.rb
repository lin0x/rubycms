module PostsHelper
	def url_for_post post
		root_path + "posts/#{post.id}"
	end

	def current_post id
		@post_title = sanitize(Post.find(strip_tags(id)).title)
	end

end
