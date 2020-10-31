FactoryBot.define do
  factory :comment do 
    content { "この記事は編集、削除できません。" }
    association :user
    association :post
  end
end