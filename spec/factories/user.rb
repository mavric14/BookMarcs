FactoryGirl.define do
  factory :user do |u|
  u.name 'Admin User' 
  u.email 'admin@example.com'
  u.password 'helloworld'
  end
end