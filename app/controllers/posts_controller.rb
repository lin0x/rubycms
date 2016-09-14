class PostsController < ApplicationController
  
  layout "blogitem"
  
  def index
    @posts = Post.joins(:category, :user).where(:published => true).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

end
