FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.name}
    first_name {"お"}
    last_name {"か"}
    first_katakana {"オ"}
    last_katakana {"カ"}
    birthday {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end