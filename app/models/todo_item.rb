class TodoItem < ApplicationRecord
  belongs_to :todos
  validates: :description, :todo 
end
