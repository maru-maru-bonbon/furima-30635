class ShippingAddress < ApplicationRecord
  belongs_to :purchase_detail
end
