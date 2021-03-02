# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#8.times do |i|
#  Twat.create(name: "Twat numero #{i}", user_id: 7)
#end

10.times do |i|
  Like.create(user_id: 3, twat_id:i)
end

10.times do |i|
  Like.create(user_id: 4, twat_id:i)
end
