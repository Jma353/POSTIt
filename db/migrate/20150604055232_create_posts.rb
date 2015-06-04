class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :postName
      t.text :content
      t.string :poster

      t.timestamps null: false
    end
  end
end
