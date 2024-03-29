FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {"山田"}
    firstname             {"太郎"}
    lastname_kana         {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birthday              {"1930-01-31"}
  end
end