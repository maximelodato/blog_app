class Photo < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :article, optional: true
  has_one_attached :image

  validates :image, presence: true
  validates :user_id, presence: true, unless: -> { article_id.nil? }
end
