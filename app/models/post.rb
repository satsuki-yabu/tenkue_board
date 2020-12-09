class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy 
  has_many :likes, dependent: :destroy 

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  def liked_by?(user)
    self.likes.exists?(user_id: user.id)
  end
end
