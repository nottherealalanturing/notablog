class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamps
    end
    add_reference(:comments, :author, foreign_key: { to_table: :users }, index: { unique: true })
    add_reference(:comments, :post, index: { unique: true })
  end
end
