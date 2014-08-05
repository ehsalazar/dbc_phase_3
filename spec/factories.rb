# factory girl allows us to create objects on demand. We define a blueprint and it uses that to create an object, save it to the database and give us back what we want.

FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.word }
  end

  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
  end
end
