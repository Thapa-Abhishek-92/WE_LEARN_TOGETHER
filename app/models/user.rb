# app/models/user.rb
class User < ApplicationRecord
  # Devise（既存のまま）
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 関連
  has_many :posts, dependent: :destroy
end
