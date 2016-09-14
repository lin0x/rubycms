class CategoriesController < ApplicationController
  layout "application"
  def show
  	   #ids = params[:id]
	   @category = Category.includes(:posts).find_by(params[:id])
  	   #@category = Category.joins(:pages).find(params[:id]).merge(:order => :desc)
  	   #@category = Category.includes(:pages).find(params[:id], :order => "created_at DESC")
  	   #@category = Category.find_by_sql("SELECT * FROM categories INNER JOIN pages ON 
  		#	categories.id = pages.category_id")

   end
end
