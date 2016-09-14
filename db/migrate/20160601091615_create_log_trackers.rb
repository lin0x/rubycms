class CreateLogTrackers < ActiveRecord::Migration
  def change
    create_table :log_trackers do |t|
      t.string :visitor_ip
      t.string :visitor_url
      t.string :visitor_searching_keywords

      t.timestamps null: false
    end
  end
end
