# app/models/post.rb
class Post < ApplicationRecord
  # 関連
  belongs_to :user

  # バリデーション（既存を保持）
  validates :title,     presence: true, length: { maximum: 50 }
  validates :situation, presence: true, length: { maximum: 100 }
  validates :content,   presence: true, length: { maximum: 1000 }
end
