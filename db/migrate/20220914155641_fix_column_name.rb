class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :likes_couter, :likes_counter
  end
end
