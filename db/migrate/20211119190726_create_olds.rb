class CreateOlds < ActiveRecord::Migration[5.2]
  def change
    create_table :olds do |t|
      t.string :name
      t.string :company
      t.integer :price
      t.integer :modal
      t.integer :seat
      t.integer :owner
      t.string :desc

      t.timestamps
    end
  end
end
