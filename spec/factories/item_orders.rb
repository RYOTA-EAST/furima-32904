FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdefg000000000' }
    user_id { 10 }
    item_id { 10 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '夕張市' }
    address { 'メロン町' }
    explosive { 'メゾン夕張' }
    phone_number { '08022222222' }
  end
end
