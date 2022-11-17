# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all

1000.times do
  movie_title = Faker::Movie.title
  movie_overview = Faker::Movie.quote
  movie_url = Faker::Internet.url
  movie_rating = rand(0..5)

  Movie.create(
    title: movie_title,
     overview: movie_overview,
      poster_url: movie_url,
      rating: movie_rating)
end
