class Book < ApplicationRecord
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  belongs_to :user
  validates :title, :author, :description, presence: true
  has_one_attached :cover
  scope :recent, -> { where("created_at > ?", 1.week.ago) }
  scope :with_genres, -> { includes([:book_genres, :genres]) }

  enum status: {published: 0, draft: 1}

  def all_genres=(names)
    self.genres = names.split(",").map do |name|
      Genre.where(title: name.strip).first_or_create!
    end
  end

  def self.in_genres_ids(genres)
    Array(genres)
      .map { |title| Book.joins(:genres).where("genres.title" => title) }
      .map { |relation| relation.pluck(:id).to_set }
      .inject(:intersection).to_a
  end
end
