# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
#   user=User.new(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password
#   )
#   user.save!
# end

# 10.times do
#   genre=Genre.new(
#     title: Faker::Book.unique.genre,
#   )
#   genre.save!
# end

users = User.all
10.times do
  users.each do |user| 
    book = user.books.create!(
      title: Faker::Book.title,
      author: Faker::Book.author,
      description: Faker::Lorem.paragraphs(number: rand(2..8)).join('\n'),
      status: [0, 1].sample
      genres: Genre.all.sample(3)
    )
  book.cover.attach(io: URI.open('https://d29zunrt9sid73.cloudfront.net/speaker_media/asset/28695/portrait_70_28695.png'), filename: 'pokemon.png', content_type: 'image/png')
  book.save!
  end
end