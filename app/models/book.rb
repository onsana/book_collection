class Book < ApplicationRecord
  has_many :book_genres
  has_many :genres, through: :book_genres
  belongs_to :user
  validates :title, :author, :description, presence: true
  has_one_attached :cover

  enum status: {published: 0, draft: 1}
end
