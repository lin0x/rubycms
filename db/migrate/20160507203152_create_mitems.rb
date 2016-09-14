class CreateMitems < ActiveRecord::Migration
  def change
    create_table :mitems do |t|
      t.string :title
      t.string :url
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
