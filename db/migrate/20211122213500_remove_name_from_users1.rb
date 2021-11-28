class RemoveNameFromUsers1 < ActiveRecord::Migration[5.2]
  def change
    remove_column :line_items, :quantity, :integer

    add_column :line_items,:quantity,:integer,:default=>1
  end
end
