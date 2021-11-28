class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :card_id
      t.integer :old_id
      t.integer :quantity

      t.timestamps
    end
  end
end
