class RemoveNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :line_items, :card_id, :integer

    add_column :line_items,:cart_id,:integer
  end
end
