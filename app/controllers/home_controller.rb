class HomeController < ApplicationController	
	layout "home"

	def index
		@menus = Menu.all
	end

end