require 'spec_helper'

feature 'User sends a book mark by email' do
   describe "A BookMarcMailer" do
      before (:each) do
        @message1 = FactoryGirl.build(:mail)
        @message2= FactoryGirl.build(:mail, :subject => '#Gittish')

       user = FactoryGirl.build(:user)
        user.skip_confirmation!
        user.save
       catigory = FactoryGirl.create(:category) 
      end
     
       it "should add new book mark to database" do 
        
        #assert_equal "admin@example.com", @message.from
        BookMarcMailer.receive(@message1)
        u = User.find_by_email(@message1.from.first)
        expect(u.bookmarks.first.url).to eql(@message1.body.to_s)
       end

       it "should catigorize bookmarc by subject line to a category that has allredy been created" do
        BookMarcMailer.receive(@message1)
        u = User.find_by_email(@message1.from.first)
        expect(u.bookmarks.first.category.name).to eql(@message1.subject)
       end

       it "should catigorize bookmark by subject line to a category that is a new category" do
        BookMarcMailer.receive(@message2)
        u = User.find_by_email(@message1.from.first)
        expect(u.bookmarks.first.category.name).to eql(@message2.subject) 
       end     

       after(:each) do
        DatabaseCleaner.clean 
      end
     
  end 
end