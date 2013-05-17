class CreatePostToTag < ActiveRecord::Migration
  def change

    create_table :post_tags, :id => false do |t|
      t.references :post
      t.references :tag
    end
    
  end
end
