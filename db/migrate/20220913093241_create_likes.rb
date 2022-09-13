class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.timestamps
    end
    add_reference(:likes, :author, foreign_key: {to_table: :users}, index: { unique: true })
    add_reference(:likes, :post, index: { unique: true })
  end
end
