class RemoveIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :comments, :author_id
    remove_index :posts, :author_id
    remove_index :likes, :author_id
    remove_index :likes, :post_id
    remove_index :comments, :post_id
    
  end
end
