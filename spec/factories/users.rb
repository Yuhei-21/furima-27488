FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"田中"}
    family_name           {"太郎"}
    first_name_kana       {"タナカ"}
    family_name_kana      {"タロウ"}
    birthday              {"19901021"}
  end
  
end