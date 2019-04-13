# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


parent_category_1 = Category.create(name: Faker::Lorem.word)
parent_category_2 = Category.create(name: Faker::Lorem.word)

2.times do
  Category.create(name: Faker::Lorem.word, parent: parent_category_1)
end

3.times do
  Category.create(name: Faker::Lorem.word, parent: parent_category_2)
end


Category.all[0..3].each do |cat|
   Item.create(name: Faker::Lorem.word, category: cat, desc: Faker::Lorem.sentence)
end