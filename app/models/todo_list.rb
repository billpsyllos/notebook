class TodoList < ActiveRecord::Base
  validates :title, presence: true
  validate :title, length: { minimum:  3 }
end
