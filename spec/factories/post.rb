FactoryBot.define do
  factory :post do 
    content { "記事を投稿しました" }
    association :user
  end
end