FactoryBot.define do

  factory :item do
    name                  {"hoge"}
    price                 {"400"}
    category_id           {"3"}
    condition_id          {"3"}
    item_explanation      {"ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ"}
    preparationday_id     {"3"}
    postagepayer_id       {"3"}
    postagetype_id        {"3"}
    image               { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/redstyakiA033_TP_V.jpg')) }
  end

end