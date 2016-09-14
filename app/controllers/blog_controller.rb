class BlogController < ApplicationController

	layout "blog"

	def index
		@posts = Post.where(:published => true).order("created_at DESC").
		paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@post = Post.find(params[:id])
	end

end