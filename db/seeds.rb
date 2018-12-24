# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



9.times do 
    User.create!( username: Faker::FunnyName.unique.name , email: Faker::Internet.email, password: "password")
end

User.first.update(admin: true)
5.times do     
    Article.create!(title: Faker::Artist.unique.name, description: Faker::Lorem.paragraph, user_id: User.first.id)     
end
5.times do     
    Article.create!(title: Faker::Food.unique.dish , description: Faker::Food.description, user_id: User.last.id)     
end

10.times do
    Category.create! name: Faker::Color.unique.color_name
end

 Article.all.each do | art| 
      ArticleCategory.create( article_id: art.id, category_id: 3)
end

 Article.all.each do | art| 
      ArticleCategory.create( article_id: art.id, category_id: 1)
end
    
 