# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying vocab..."
Vocab.destroy_all
puts "generating vocab..."
Vocab.create!(french: 'sourcil', english: 'eyebrow')
Vocab.create!(french: 'narine', english: 'nostril')
Vocab.create!(french: 'merci', english: 'thank you')
puts "done"
