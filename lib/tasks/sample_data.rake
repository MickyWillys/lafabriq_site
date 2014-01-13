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
  

    desc "Add competences to the user"
    users = User.all(limit: 10)
    6.times do
      titre =  Faker::Lorem.sentences(1).first[0...20]
      descriptif =  Faker::Lorem.sentences(5).first
      experience =  Faker::Lorem.sentences(1).first
      diplome =  Faker::Lorem.sentences(1).first
      statut_validation =  Faker::Lorem.sentences(1).first

      users.each {|user| user.competences.create!(titre: titre,
                                                  descriptif: descriptif,
                                                  experience: experience,
                                                  diplome: diplome,
                                                  statut_validation: statut_validation)}
    end
  end
end