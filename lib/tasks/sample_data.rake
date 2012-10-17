namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin1 = User.create!(name: "haoy",
                 email: "haoy@andrew.cmu.edu",
                 password: "65778079",
                 password_confirmation: "65778079")
    admin1.toggle!(:admin)

    admin2 = User.create!(name: "ZiKai Tea",
                          email: "65778079@qq.com",
                          password: "65778079",
                          password_confirmation: "65778079")
    admin2.toggle!(:admin)


  #  99.times do |n|
  #    name  = Faker::Name.name
  #    email = "example-#{n+1}@railstutorial.org"
  #    password  = "password"
  #    User.create!(name: name,
  #                 email: email,
  #                 password: password,
  #                 password_confirmation: password)
  #  end
  #  users = User.all(limit: 6)
  #  20.times do
  #    content = Faker::Lorem.sentence(5)
  #    users.each { |user| user.movie_comments.create!(movie: content,comment: content) }
  #  end
  end
end