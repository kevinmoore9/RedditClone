class FixNull < ActiveRecord::Migration
  def change

        change_column :posts, :sub_id, :integer, null: true
        change_column :post_subs, :sub_id, :integer, null: true
        change_column :post_subs, :post_id, :integer, null: true
  end
end
