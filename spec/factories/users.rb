FactoryBot.define do
  factory :user, class: User do 
    name { "satsuki" }
    email { "satsuki@gmail.com" }
    password { "satsuki1234" }
  end
end