module ApplicationHelper
  def genre_links(genres)
    genres.split(",").map { |genre| link_to genre.strip, genre_path(genre.strip) }.join(", ")
  end

  def book_genres_list(book_id)
    Book.with_genres.find(book_id).genres.map(&:title).join(", ")
  end
end
