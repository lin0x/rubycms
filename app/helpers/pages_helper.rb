module PagesHelper
	def url_for_page page
		if page.slug.present?
			root_path + page.slug
		else
			root_path+"pages/#{page.id}"
		end
	end

	def current_page_img currentPage
		@img = Page.includes(:image).where(page_id: currentPage.id)
	end
end
