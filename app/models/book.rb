class Book < ApplicationRecord
  has_many: book_genres
  has_many: genres, through: :book_genres
  belongs_to :user

  enum :status, { published: 0, draft: 1 }
end
