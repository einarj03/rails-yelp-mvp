# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all

categories = %w[chinese italian japanese french belgian]

5.times do
  resto = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: categories.sample,
    phone_number: Faker::PhoneNumber.phone_number
    )
  2.times do
    Review.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: resto
      )

  end
end
