# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do |i|
    city = City.create!(name: Faker::Address.city)
    puts "cities created" if i == 19
end

21.times do |i| 
    usr = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, email: Faker::Internet.email, age: rand(18..99), city_id: rand(1..20))
    puts "users created" if i == 20
end

100.times do |i| 
    gossip = Gossip.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(sentence_count:300), user_id: rand(1..20))
    puts "gossips created" if i == 99
end

10.times do |i| 
    tag = Tag.create!(title: Faker::Lorem.word)
    puts "tags created" if i == 9
end

150.times do |i| 
    join = JoinGossipTag.create!(gossip_id: rand(1..50), tag_id: rand(1..10))
    puts "join_gossip_tags created" if i == 149
end