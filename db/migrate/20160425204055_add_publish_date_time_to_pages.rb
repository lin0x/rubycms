class AddPublishDateTimeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :publish_date_time, :string
  end
end
