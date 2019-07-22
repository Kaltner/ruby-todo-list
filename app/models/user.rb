class User < ApplicationRecord
  # has_many :todos
  validates :name, presence: true
  validates :password, confirmation: true, presence: true
  validates :email, format: {with: /.*@[a-zA-Z]+\..+/, message:"Invalid Email"}, presence: true
end
