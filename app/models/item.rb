class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to :user


  validates :image, presence: true, unless: :was_attached?
  validates :name, presence: true  
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :delivery_time_id, presence: true
  validates :selling_price, presence: true
  with_options format: { with: /\A[0-9]+\z/} do
    validates :selling_price, numericality: {only_integer: true, greater_than:299,less_than: 9999999}
  end
  validates :category_id, :condition_id, :shipping_area_id, :shipping_charge_id, :delivery_time_id, numericality: { other_than: 1 } 
  has_one_attached :image
  def was_attached?
    self.image.attached?
  end
end
