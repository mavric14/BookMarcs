require 'spec_helper'

feature 'User sees only his bookmarks' do
  describe "Showing bookmarks" do 
    before (:each) do
      message = FactoryGirl.build(:mail)
      #message2= FactoryGirl.build(:mail, :subject => '#Gittish')
      user = FactoryGirl.build(:user)
      user.skip_confirmation!
      user.save
      catagory = FactoryGirl.create(:category) 
      #cat = Category.create(name: "#Test Driven")
      #user.bookmarks.create(url: message.body.to_s, category: cat.id) 
      #BookMarcMailer.receive(message)
      user.bookmarks.create(url: message.body.to_s, category_id: catagory.id) 
    end

    it "should show catagory" do 
      visit bookmarc_index_path
      page.should have_content("#Test Driven")
    end
  end
end
  