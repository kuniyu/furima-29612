FactoryBot.define do
  factory :user do
    nickname              {'k'}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    last_name             {'名字'}
    first_name            {'名前'}
    last_name_kana        {'ミョウジ'}
    first_name_kana       {'ナマエ'}
    birthday              { Date.new(2000, 11, 12) }
  end
end