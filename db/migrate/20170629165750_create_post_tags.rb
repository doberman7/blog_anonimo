class CreatePostTags < ActiveRecord::Migration[5.0]
  def change
    create_table :post_tags do |t|
      t.belongs_to :tags
      t.belongs_to :posts
      # t.integer :id_post
      # t.integer :id_tag
      t.timestamps
    end
  end
end
