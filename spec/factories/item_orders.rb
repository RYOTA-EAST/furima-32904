FactoryBot.define do
  factory :item_order do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'夕張市'}
    address {'メロン町'}
    explosive {'メゾン夕張'}
    phone_number{'08022222222'}
  end
end
