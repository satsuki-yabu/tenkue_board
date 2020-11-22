FactoryBot.define do
  factory :comment do 
    content { "は不正な値です" }
    association :post
    user { post.user }
  end
end