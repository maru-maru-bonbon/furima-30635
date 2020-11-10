FactoryBot.define do
  factory :item do
    name {"大きな"}
    description {"ううう"}
    category_id {3}
    condition_id {2}
    shipping_charge_id {2}
    delivery_time_id {2}
    shipping_area_id {2}
    selling_price {"400"}
    user
  end
end
