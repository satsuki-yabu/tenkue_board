class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  

  validates :name, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w\_!#\$%&*+\-\/=\?^_{|}\~.]+@[a-z0-9]+.[a-z0-9]/
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX,
            message: 'は不正な値です' }
  
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true,
             format: { with: VALID_PASSWORD_REGEX,
             message: "は半角英字と半角数字のいずれとも含まれ、8文字以上32文字以下である必要があります" }

end
