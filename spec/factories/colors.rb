FactoryGirl.define do
  factory :color do
    hex { Faker::Color.hex_color }
  end
end
