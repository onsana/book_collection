5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

10.times do
  genre = Genre.new(
    title: Faker::Book.unique.genre
  )
  genre.save!
end

users = User.all
20.times do
  users.each do |user|
    book = user.books.create!(
      title: Faker::Book.title,
      author: Faker::Book.author,
      description: Faker::Lorem.paragraphs(number: rand(2..8)).join('\n'),
      status: [0, 1].sample,
      genres: Genre.all.sample(3),
      created_at: Faker::Date.between(from: 14.days.ago, to: Date.today)
    )
    book.cover.attach(io: URI.open("https://d29zunrt9sid73.cloudfront.net/speaker_media/asset/28695/portrait_70_28695.png"), filename: "pokemon.png", content_type: "image/png")
    book.save!
  end
end
