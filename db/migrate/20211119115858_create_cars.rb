class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.float :price
      t.string :desc

      t.timestamps
    end
  end
end
