FactoryBot.define do
  factory :history_order do
    postal_code   {'123-4567'}
    area_id       {2}
    municipality  {'梅田'}
    address       {'1-1'}
    building      {''}
    phone         {'09012345678'}
    token         {'xxxxxxxxxxxxxxxxx'}
  end
end