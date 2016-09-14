class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_title
      t.string :comment_content
      t.boolean :showable, default: false
      t.references :User, index: true, foreign_key: true
      t.references :Page, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
