FactoryBot.define do
  factory :item do
    image              {Faker::Lorem.sentence}
    items_name         {Faker::Name.initials}
    items_text         {Faker::Lorem.sentence}
    category_id        {2}
    status_id          {2}
    delivery_id        {2}
    area_id            {2}
    shopping_day_id    {2}
    price              {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
