class Post < ApplicationRecord
  validates :title, :body, :category_id, presence: true
  # attr_accessor :title, :body, :category_id, :author_id
  belongs_to :category
end
