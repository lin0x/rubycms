class CreateAnalitycs < ActiveRecord::Migration
  def change
    create_table :analitycs do |t|
      t.string :vistor_ip
      t.string :visitor_url
      t.string :visitor_google_keyword
      t.datetime :visit_time

      t.timestamps null: false
    end
  end
end
