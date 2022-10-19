FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'苗字'}
    last_name             {'名前'}
    first_name_kana       {'フリガナ'}
    last_name_kana        {'フリガナ'}
    birthday              {Faker::Date.birthday}
  end
end