# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
Booking.destroy_all
Animal.destroy_all
User.destroy_all


puts "Creating Lisa Sallou (owner) and her animals Polly and Sugar"
lisa = User.new(
  first_name: 'Lisa',
  last_name: 'Sallou',
  bio: "I love to sing songs about alpagas!",
  email: 'lisa@sallou.com',
  password: "123456"
  )
file = URI.open("https://res.cloudinary.com/darvd5cv4/image/upload/v1574336183/lisa_kzdkaq.jpg")
lisa.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
lisa.save!

polly = Animal.new(
  name: 'Polly',
  breed: 'Llama',
  birth_date: 'Thu, 13 Oct 2016',
  colour: 'White',
  address: "40 rue des Trois Frères, Paris",
  price: 120,
  description: 'Beautiful llama that does not spot on people!',
  )
polly.user_id = lisa.id
file = URI.open("https://res.cloudinary.com/darvd5cv4/image/upload/v1574336556/polly_wkmuzq.jpg")
polly.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
polly.save!

sugar = Animal.new(
  name: 'Sugar',
  breed: 'Camel',
  birth_date: 'Thu, 13 Oct 2014',
  colour: 'White',
  address: "16 Villa Gaudelet, Paris",
  price: 80,
  description: 'Only the best camel!',
  )
sugar.user_id = lisa.id
file = URI.open("https://res.cloudinary.com/darvd5cv4/image/upload/v1574336300/sugar_jlj4ab.jpg")
sugar.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
sugar.save!


puts "Creating Matthieu Michel (owner) and his animals Jazz and Diva"
matthieu = User.new(
  first_name: 'Matthieu',
  last_name: 'Michel',
  bio: "I love to sing songs about alpagas!",
  email: 'matthieu@michel.com',
  password: "123456"
  )
file = URI.open("https://res.cloudinary.com/darvd5cv4/image/upload/v1574336213/matthieu_zvvsur.jpg")
matthieu.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
matthieu.save!

jazz = Animal.new(
  name: 'Jazz',
  breed: 'Llama',
  birth_date: 'Thu, 13 Oct 2015',
  colour: 'Black',
  address: "57 Boulevard des Invalides, Paris",
  price: 150,
  description: 'Very nice llama!',
  )
jazz.user_id = matthieu.id
file = URI.open("https://res.cloudinary.com/darvd5cv4/image/upload/v1574336183/jazz_h5lawx.jpg")
jazz.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
jazz.save!

diva = Animal.new(
  name: 'Diva',
  breed: 'Camel',
  birth_date: 'Thu, 13 Oct 2010',
  colour: 'Brown',
  address: "1 Rue René Panhard, Paris",
  price: 200,
  description: 'Nice and gentle camel.',
  )
diva.user_id = matthieu.id
file = URI.open("https://res.cloudinary.com/darvd5cv4/image/upload/v1574336183/diva_zam6st.jpg")
diva.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
diva.save!


puts "Creating Serge (renter) and some bookings..."
serge = User.new(
  first_name: 'Serge',
  last_name: 'Lama',
  bio: "I love to sing songs about llamas!",
  email: 'serge@lama.com',
  password: "123456"
  )
file = URI.open("https://res.cloudinary.com/darvd5cv4/image/upload/v1574336233/serge_toshsv.jpg")
serge.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
serge.save!

booking_polly = Booking.new(
  date_in: 'Mon, 14 Jan 2019',
  date_out: 'Sun, 20 Jan 2019',
  status: 'completed'
  )
booking_polly.animal_id = polly.id
booking_polly.user_id = serge.id
booking_polly.save!

booking_jazz = Booking.new(
  date_in: 'Mon, 10 Sep 2019',
  date_out: 'Sun, 15 Sep 2019',
  status: 'confirmed'
  )
booking_jazz.animal_id = jazz.id
booking_jazz.user_id = serge.id
booking_jazz.save!

# puts "Creating other users with animals and bookings..."
# 5.times do
#   random_name = Faker::Name.middle_name
#   random_name_llama = Faker::Name.middle_name

#   random_name = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     bio: "i love all the llamas and all the alpaga and all the camels and if they don't love me back i kill them",
#     email: Faker::Internet.email,
#     password: "123456"
#     )
#   # puts "#{random_name.first_name} ok"
#   puts "email : #{random_name.email}"
#   file = URI.open("https://source.unsplash.com/600x400/?portrait")
#   random_name.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
#   random_name.save
#   random_name.save!
#   puts "photo added"

#   rand(0..5).times do
#     random_name_llama = Animal.new(
#       name: Faker::Creature::Horse.name,
#       breed: ['Alpaga', 'Camel','Llama'].sample,
#       age: Faker::Number.between(from: 1, to: 20),
#       colour: Faker::Color.hex_color,
#       address: ["103 rue Petite Fusterie, Bordeaux", "41-61 Rue Centrale, La Clayette ", "67 Rue Abbé de l'Épée, Marseille", "6 Rue Ferdinand Duval, Paris", "24 rue voltaire, Paris", "villa gaudelet, paris"].sample,
#       price: Faker::Number.between(from: 20, to: 200),
#       description: Faker::Marketing.buzzwords,
#       # photo: "https://source.unsplash.com/600x400/?llama"
#       )
#     random_name_llama.user_id = random_name.id
#     puts "#{random_name_llama.name} ok"
#     puts "breed : #{random_name_llama.breed}"
#     # random_name_llama.photo = "https://source.unsplash.com/600x400/?llama"
#     file = URI.open("https://source.unsplash.com/600x400/?llama")
#     random_name_llama.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
#     random_name_llama.save!
#     puts "photo added"

#     rand(0..5).times do
#       booking = Booking.new(
#         date_in: Faker::Date.forward(days: 10),
#         date_out: Faker::Date.forward(days: 23),
#         status: ['pending', 'confirmed', 'declined', 'completed'].sample

#         # status: ['pending', 'confirmed', 'declined', 'completed'].sample
#         status: 'completed'
#         )
#       if booking.status == 'completed'
#         booking.review_rating =  Faker::Number.between(from: 1, to: 5)
#         booking.review_description = Faker::Marketing.buzzwords
#       end
#       booking.animal_id = random_name_llama.id
#       booking.user_id = random_name.id
#       booking.save!
#       puts "booking #{booking.id} is #{booking.status}"
#     end
#   end
# end


puts 'Finished!'






# User.destroy_all

# alexia = User.new(
#   first_name: 'Alexia',
#   last_name: 'Jolly',
#   bio: "Super sympa, j'adore tout ce qui est doux et frisé.",
#   email: 'alexia@lamalovers.com',
#   password: '123456'
#   )
# file = URI.open("https://lh3.googleusercontent.com/0orgEU0W5HH1rpmy_xLZjKDr43mWLBrBymNSHiA1mc3LJGLmEuJPRC2JkLw-1xTeeNp6O5UEvQmXhQTRG_21XccCOv-TEPlDUz5Oo6CmHZk2rummUNT0KGM0HEpby6_N3joRuodCZg=w2414-h1606-no")
# alexia.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
# alexia.save
# puts "alexia ok"

# anniou = User.new(
#   first_name: 'Anniou',
#   last_name: 'Toybou',
#   bio: "Super sympa, j'adore tout ce qui est doux et dru.",
#   email: 'anniou@lamalovers.com',
#   password: '123456'
#   )
# file = URI.open("https://lh3.googleusercontent.com/_39ILGN-UgKW5iAQ5PlFGuvMKL1d-cfw8s97Jj2_eJoKjhILqMB_NaG0y-0mnM9kKy_RUYSxgUjU6P27HD7cHsKx4Kazs5I9cqZ7gjEY-qUR7l2GLqbsQF49hq7gRbEPfRFmYCuEOw=w461-h307-no")
# anniou.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
# anniou.save
# puts "anniou ok"

# anais = User.new(
#   first_name: 'Anais',
#   last_name: 'Roth',
#   bio: "Assez sympa, j'adore tout ce qui est fait en poil d'alpaga.",
#   email: 'anais@alpagalovers.com',
#   password: '123456'
#   )

# file = URI.open('https://lh3.googleusercontent.com/DoCbT4RNcjrh0K5a6TdzszDjUCQjgQuAD9CFFofnwVJli8FPpHnkxA2Thll90Iy30t3sRhlBSHw5EVDLsp0wUB_0q2lE0z4oZa-lXka7THA-cjoyWBj8BqJrGGQwAhowtukCf-j6nKc=w2414-h1606-no')
# anais.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
# anais.save
# puts "anais ok"
