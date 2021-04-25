FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipal { '高岡市' }
    block_number { '1-1' }
    building_number { 'ハイツ' }
    phone_number {'00000000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end