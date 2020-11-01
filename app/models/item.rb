class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true  
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :delivery_time_id, presence: true
  validates :selling_price, presence: true
end
