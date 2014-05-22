require 'spec_helper'


feature 'User sends a book mark by email' do
   context "A BookMarcMailer" do
      before (:each) do
        @message = Mail.new do 
          from 'admin@example.com'
          to 'blablabla@bookmarcs.com'
          #subject
         
          body 'http://steve.dynedge.co.uk/2010/11/29/receiving-test-driven-incoming-email-for-rails-3/'
           
        end

        
        #DatabaseCleaner.clean 

       user = User.new( name: 'Admin User', email: 'admin@example.com', password:'helloworld')
        user.skip_confirmation!
        user.save
       # puts user.email
    
      end
     
       it "should add new book mark to data base" do 
        
        #assert_equal "admin@example.com", @message.from
        BookMarcMailer.receive(@message)
        u = User.find_by_email(@message.from.first)
        expect(u.book_mark).to eql(@message.body.to_s)
       end

       after(:each) do
        DatabaseCleaner.clean 
      end
     
  end 
end
