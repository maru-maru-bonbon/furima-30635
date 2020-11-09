class FormObject
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_detail, :token, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :purchase_detail

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: { other_than: 1}

  def save
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_detail_id:purchase_detail.id)
    PurchaseDetail.create(item_id: item.id, user_id: current_user.id)
  end
end