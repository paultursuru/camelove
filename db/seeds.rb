# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

puts "Creating users"

alexia = User.new(
  first_name: 'Alexia',
  last_name: 'Jolly',
  bio: "Super sympa, j'adore tout ce qui est doux et frisé.",
  email: 'alexia@lamalovers.com',
  password: '123456'
  )
file = URI.open("https://lh3.googleusercontent.com/0orgEU0W5HH1rpmy_xLZjKDr43mWLBrBymNSHiA1mc3LJGLmEuJPRC2JkLw-1xTeeNp6O5UEvQmXhQTRG_21XccCOv-TEPlDUz5Oo6CmHZk2rummUNT0KGM0HEpby6_N3joRuodCZg=w2414-h1606-no")
alexia.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
alexia.save!
puts "alexia ok"

anniou = User.new(
  first_name: 'Anniou',
  last_name: 'Toybou',
  bio: "Super sympa, j'adore tout ce qui est doux et dru.",
  email: 'anniou@lamalovers.com',
  password: '123456'
  )
file = URI.open("https://lh3.googleusercontent.com/_39ILGN-UgKW5iAQ5PlFGuvMKL1d-cfw8s97Jj2_eJoKjhILqMB_NaG0y-0mnM9kKy_RUYSxgUjU6P27HD7cHsKx4Kazs5I9cqZ7gjEY-qUR7l2GLqbsQF49hq7gRbEPfRFmYCuEOw=w461-h307-no")
anniou.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
anniou.save!
puts "anniou ok"

anais = User.new(
  first_name: 'Anais',
  last_name: 'Roth',
  bio: "Assez sympa, j'adore tout ce qui est fait en poil d'alpaga.",
  email: 'anais@alpagalovers.com',
  password: '123456'
  )

file = URI.open('https://lh3.googleusercontent.com/DoCbT4RNcjrh0K5a6TdzszDjUCQjgQuAD9CFFofnwVJli8FPpHnkxA2Thll90Iy30t3sRhlBSHw5EVDLsp0wUB_0q2lE0z4oZa-lXka7THA-cjoyWBj8BqJrGGQwAhowtukCf-j6nKc=w2414-h1606-no')
anais.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
anais.save!
puts "anais ok"

puts "Finished!"
