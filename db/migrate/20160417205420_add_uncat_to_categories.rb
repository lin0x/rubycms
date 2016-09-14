class AddUncatToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :uncat, :boolean , default: false
  end
end
