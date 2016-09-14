class CommentsController < ApplicationController
  before_action :find_comments
  before_action !authenticate_user

  def new
  	@comment = current_user.comment.build
  end

  def create
  	@comment = current_user.comment.build(comment_params)
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  def destroy
  end

  private 

  def find_comments
  	@comment = Comment.find(params[:id])
  end

  def comment_params
  	params.require(:comment).permit(:comment_title, :comment_content)
  end
end
