class FormObject
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_detail_id, :token, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number,  length: { maximum: 11 } 
    validates :phone_number,  numericality: { only_integer: true }
    validates :token

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含んで入力して下さい"}
  end
  validates :prefecture_id, numericality: { other_than: 1 ,message:  "を選択して下さい"}

  def save
    purchasedetail = PurchaseDetail.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create!(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_detail_id:purchasedetail.id)
  end
end