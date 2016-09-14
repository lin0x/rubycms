class AddPublishDateTimeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publish_date_time, :string
  end
end
