# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "cleaning up database"

Booking.destroy_all

puts "Bookings destroyed"

Car.destroy_all

puts "Cars destroyed"

User.destroy_all

puts "Users destroyed"

puts "Database cleaned"

# Demo users
User.create!(
  email: "mail@me.com",
  password: 123456
)

User.create!(
  email: "mail2@me.com",
  password: 123456
)

User.create!(
  email: "mail3@me.com",
  password: 123456
)

User.create!(
  email: "mail4@me.com",
  password: 123456
)

User.create!(
  email: "mail5@me.com",
  password: 123456
)

User.create!(
  email: "mail6@me.com",
  password: 123456
)

User.create!(
  email: "mail7@me.com",
  password: 123456
)

User.create!(
  email: "mail8@me.com",
  password: 123456
)

User.create!(
  email: "mail9@me.com",
  password: 123456
)

puts "created #{User.count} users"

user_id_first = User.first.id
user_id_last = User.last.id

car1 = Car.create!(
user_id: rand(user_id_first..user_id_last),
brand: "Audi",
model: "Luxury Vehicle",
address: "Curepipe",
year_of_production: 2020,
price_per_day: 2000
)

car2 = Car.create!(
user_id: rand(user_id_first..user_id_last),
brand: "BMW",
model: "Luxury Vehicle",
address: "Tamarin",
year_of_production: 2019,
price_per_day: 3000
)

car3 = Car.create!(
user_id: rand(user_id_first..user_id_last),
brand: "Ford",
model: "SUV/Truck",
address: "Coromandel",
year_of_production: 2018,
price_per_day: 2000
)

car4 = Car.create!(
user_id: rand(user_id_first...user_id_last),
brand: "Citroen",
model: "Small Vehicle",
address: "Moka",
year_of_production: 2012,
price_per_day: 900
)

car5 = Car.create!(
user_id: rand(user_id_first...user_id_last),
brand: "Kia",
model: "Medium Vehicle",
address: "Vacoas",
year_of_production: 2016,
price_per_day: 1000
)

car6 = Car.create!(
user_id: rand(user_id_first...user_id_last),
brand: "Toyota",
model: "Medium Vehicle",
address: "Floréal",
year_of_production: 2012,
price_per_day: 1000
)

car7 = Car.create!(
user_id: rand(user_id_first...user_id_last),
brand: "Suzuki",
model: "Small Vehicle",
address: "Quatre Bornes",
year_of_production: 2015,
price_per_day: 900
)

car8 = Car.create!(
  user_id: rand(user_id_first...user_id_last),
  brand: "Volkswagen",
  model: "Medium Vehicle",
  address: "Pailles",
  year_of_production: 2015,
  price_per_day: 1000
  )

  car9 = Car.create!(
    user_id: rand(user_id_first...user_id_last),
    brand: "Nissan",
    model: "SUV/Truck",
    address: "Savanne",
    year_of_production: 2015,
    price_per_day: 2000
    )

puts "Created #{Car.count} cars"

car_id_first = Car.first.id
car_id_last = Car.last.id

9.times do
  Booking.create!(
    car_id: rand(car_id_first..car_id_last),
    user_id: rand(user_id_first..user_id_last),
    start_date: (Time.now + 5.day).to_datetime,
    end_date: (Time.now + 5.day).to_datetime,
    is_accepted: true
  )
end

puts "Created #{Booking.count} bookings"
