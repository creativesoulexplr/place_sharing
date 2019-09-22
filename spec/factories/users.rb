FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    display_name { Faker::Name.name }
    password {factory::Internet.password(5,25,true,false)}
  end

end
