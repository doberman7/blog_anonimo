class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :autor
      t.text :body
      t.string :title
      t.timestamps
    end
  end
end
