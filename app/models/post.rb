class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :title, presence: true, length: { maximum: 255 }
  validates :cast, presence: true, length: { maximum: 255 }
end
