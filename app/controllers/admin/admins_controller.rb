module Admin
	class AdminsController < AdminController
	before_filter :ensure_admin

	def ensure_admin
		if current_user.admin?
			true
		else
			redirect_to root_path
		end
	end

	def index
			@pages = Page.all.order("created_at DESC")
			@categories = Category.all
	end
	
	end
end