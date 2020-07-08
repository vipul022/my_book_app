# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.create(
  name: "J.K Rowling",
  date_of_birth: "1965-07-31"


)
Author.create(
  name: "DAN BROWN",
  date_of_birth: "1965-07-31"
  

)

Book.create(
  title: "Harry Potter",
  author_id: 1

)

genres = ["fantasy", "horror", "romance", "crime","sci-fi"]

  puts"---------" 
for i in genres
  Genre.create(name: i)
  puts "created #{i} genre"
end
