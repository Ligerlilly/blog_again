class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :commentable_id
      t.integer :user_id
      t.string :commentable_type

      t.timestamps null: false
    end
  end
end
