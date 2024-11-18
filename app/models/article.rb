# app/models/article.rb
class Article < ApplicationRecord
  belongs_to :user
  has_one :photo, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :photo
end