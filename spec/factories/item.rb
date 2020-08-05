FactoryBot.define do

  factory :item do
    name                  {"hoge"}
    price                 {"400"}
    category_id           {"3"}
    condition_id          {"3"}
    item_explanation      {"ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"}
    preparationday_id     {"3"}
    postagepayer_id       {"3"}
    postagetype_id        {"3"}
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.jpg'), filename: 'sample.jpg', content_type: 'image/jpg')
    end
  end
end