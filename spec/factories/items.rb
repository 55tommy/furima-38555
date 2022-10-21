FactoryBot.define do
  factory :item do
    product_name {Faker::String.random}
    description {Faker::String.random}
    category_id {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    price {Faker::Number.between(from: 300, to: 9999999)}
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to:48 )}
    delivery_period_id {Faker::Number.between(from: 2, to: 4)}

    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
