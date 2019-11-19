# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(
  first_name: 'Alexia',
  last_name: 'Jolly',
  bio: "Super sympa, j'adore tout ce qui est doux et frisé.",
  avatar: 'alexia.jpg',
  email: 'alexia@lamalovers.com',
  password: '123456'
  )

User.create(
  first_name: 'Anniou',
  last_name: 'Toybou',
  bio: "Super sympa, j'adore tout ce qui est doux et dru.",
  avatar: 'anniou.jpg',
  email: 'anniou@lamalovers.com',
  password: '123456'
  )

User.create(
  first_name: 'Anais',
  last_name: 'Roth',
  bio: "Assez sympa, j'adore tout ce qui est fait en poil d'alpaga.",
  avatar: 'anais.jpg',
  email: 'anais@alpagalovers.com',
  password: '123456'
  )
