class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: { minimum: 6, maximum: 12 }
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
