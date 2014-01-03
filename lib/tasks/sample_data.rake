namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(prenom: "Example",
                 nom: "User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      prenom = Faker::Name.first_name
      nom  = Faker::Name.last_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(prenom: prenom,
                   nom: nom,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
