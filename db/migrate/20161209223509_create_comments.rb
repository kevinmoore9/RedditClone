class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :author_id
      t.integer :post_id

      t.timestamps null: false
    end

    add_index :comments, :post_id
    add_index :comments, :author_id
  end
end
