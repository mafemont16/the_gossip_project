# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


User.destroy_all
City.destroy_all

20.times do 
    City.create!(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
end 
puts "2O cities have been created"

20.times do 
    User.create!(
        first_name: Faker::Artist.name,
        last_name: Faker::Name.last_name,
        description: Faker::Movies::HarryPotter.quote,
        email: Faker::Internet.email,
        age: Faker::Number.number(digits: 2),
        city: City.all.sample
    )
end 
puts "20 users have been created"

20.times do 
    Gossip.create!(
        title: Faker::Book.title,
        content: Faker::Quotes::Chiquito.sentence,
        user: User.all.sample
    )
end
puts "20 gossips have been created"

20.times do 
    Tag.create!(
        title: Faker::Creature::Animal.name

    )
end 
puts "20 tags have been created"

20.times do
    Comment.create!(
        gossip: Gossip.all.sample,
        user: User.all.sample,
        content: Faker::Hipster.sentence(word_count: 3)
    )
end 
puts "20 comments have been created"


