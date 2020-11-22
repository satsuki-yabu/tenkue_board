class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true, length: { maximum: 140 }

  scope :sorted_desc, -> { order(created_at: :desc) }
  scope :includes_user, -> { includes(:user) }
end
