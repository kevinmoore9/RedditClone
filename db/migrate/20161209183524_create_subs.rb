class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :subs, :title
    add_index :subs, :user_id
  end
end
