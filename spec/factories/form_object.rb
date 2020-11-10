FactoryBot.define do
  factory :form_object do
    postal_code {"123-4567"}
    prefecture_id {"4"}
    municipality {"ズンドゥ区"}
    address {"青山1-1-1"}
    building_name {"ザオリク"}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    association :item
    association :user
  end
end