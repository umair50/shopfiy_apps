class AddPicToEquipment < ActiveRecord::Migration[5.1]
  def change
    add_column :equipment, :picture, :string
  end
end
