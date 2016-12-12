class RemoveNullValidations < ActiveRecord::Migration
  def change

    change_column :posts, :sub_id, :integer
    change_column :post_subs, :sub_id, :integer
    change_column :post_subs, :post_id, :integer
  end
end
