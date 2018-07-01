class Equipment < ApplicationRecord
   mount_uploader :picture, EquipmentUploader
   
  def self.search(search)
    where("name LIKE ? OR price LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%") 
  end
end
