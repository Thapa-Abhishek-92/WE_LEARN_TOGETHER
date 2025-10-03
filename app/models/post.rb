class Post < ApplicationRecord
  validates :title,     presence: true, length: { maximum: 50 }
  validates :situation, presence: true, length: { maximum: 100 }
  validates :content,   presence: true, length: { maximum: 1000 }
end
