FactoryGirl.define do
  factory :user do
  	prenom	"Michael"
    nom     "Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end