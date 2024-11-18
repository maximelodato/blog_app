class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :email, presence: true
         has_many :comments, dependent: :destroy
         has_many :photos, dependent: :destroy
end
