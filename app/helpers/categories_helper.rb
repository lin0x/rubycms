module CategoriesHelper
	def get_select_data
		data = Category.all.map{|category| [category.name, category.id]}
		#data.push(["دسته بندی نشده",0])
	end
end
