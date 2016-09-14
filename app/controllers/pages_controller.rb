class PagesController < ApplicationController
	layout "application"

	def index
		@pages = Page.all.order('created_at DESC LIMIT 5')
	end
	def show
		@page = Page.find params[:id]	
	end
end