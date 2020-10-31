FactoryBot.define do
  factory :user, class: User do 
    name { "satsuki" }
    email { "satsuki@gmail.com" }
    password { "satsuki1234" }

    # after(:create) do |user|
    #   create(:post, user_id: user.id)
    # end
  end
end