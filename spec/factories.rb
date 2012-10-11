FactoryGirl.define do
  factory :user do
    name     "Mike"
    email    "Mike@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end