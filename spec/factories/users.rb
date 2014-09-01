FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "supersecret"
    password_confirmation "supersecret"
    type "Regular"
    
    factory :admin do
      type "Admin"
    end
  end
end
