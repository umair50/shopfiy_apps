class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :price
      t.string :brief_description
      t.string :features

      t.timestamps
    end
  end
end
