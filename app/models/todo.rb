class Todo < ApplicationRecord
  has_many :todo_items
  belongs_to :users
  validates :name, :user, presence: true
end
