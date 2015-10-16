class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :content, :text

      t.timestamps null: false
    end
  end
end
