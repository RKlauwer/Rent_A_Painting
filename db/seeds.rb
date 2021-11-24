# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "creating 30 seeds"
user = User.new(email: "fake@fake.com", password: 12345678, first_name: "Fake", last_name: "Fake")
user.save
30.times do
  painting = Painting.new(
    author: Faker::Artist.name,
    size: Faker::FunnyName.name,
    price: rand(1..100)
  )
  painting.user = user
  painting.save
  image_url = "https://source.unsplash.com/#{rand(30..200)}x#{rand(30..200)}/?painting"
  downloaded_image = URI.open(image_url)
  painting.photo.attach(io: downloaded_image, filename: "painting-#{painting.id}")
  painting.save!
end
puts 'Finished!'
