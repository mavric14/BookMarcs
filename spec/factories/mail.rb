FactoryGirl.define do 
  factory :mail do
    from 'admin@example.com'
    to 'blablabla@bookmarcs.com'
    subject '#Test Driven'
    body 'http://steve.dynedge.co.uk/2010/11/29/receiving-test-driven-incoming-email-for-rails-3/'
  end
end