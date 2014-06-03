require 'spec_helper'

feature 'User sees all the bookmarks' do
  describe "Showing bookmarks" do 
    before (:each) do
      message1 = FactoryGirl.build(:mail)
      message2 = FactoryGirl.build(:mail, :body => 'http://documentation.mailgun.com/faqs.html#faq')
      message3 = FactoryGirl.build(:mail, :body => 'http://diablocrossfit.com')
      user1 = FactoryGirl.build(:user)
      user1.skip_confirmation!
      user1.save
      user2 = FactoryGirl.build(:user, :email => 'member@member.com')
      user2.skip_confirmation!
      user2.save
      catagory = FactoryGirl.create(:category) 
      user1.bookmarks.create(url: message1.body.to_s, category_id: catagory.id) 
      user1.bookmarks.create(url: message2.body.to_s, category_id: catagory.id) 
      user2.bookmarks.create(url: message3.body.to_s, category_id: catagory.id)
      
    end

    it "should show catagory" do 
      visit bookmarc_index_path      
      page.should have_content("#Test Driven")
    end

    it "should show a bookmark under a catagory" do
      visit bookmarc_index_path
      page.should have_content('http://steve.dynedge.co.uk/2010/11/29/receiving-test-driven-incoming-email-for-rails-3/')
    end

    it "should show multiple bookmarks under a bookmark" do 
      visit bookmarc_index_path
      page.should have_content('http://documentation.mailgun.com/faqs.html#faq')
      page.should have_content('http://steve.dynedge.co.uk/2010/11/29/receiving-test-driven-incoming-email-for-rails-3/')
    end

    it "should show bookmarks of all users" do
      
       visit bookmarc_index_path
       page.should have_content('http://diablocrossfit.com')
     end

     it "should have a link to  users bookmaks" do 
      visit user_session_path
     # save_and_open_page
      fill_in 'Email', with: 'admin@example.com'
      fill_in 'Password', with: 'helloworld'     
      click_on('Sign in')
      click_link('My Bookmarks')
    end

  end
end

feature 'User sees only his/her bookmarks' do
  describe "show bookmarks" do 
     describe "Showing bookmarks" do 
    before (:each) do
      message1 = FactoryGirl.build(:mail)
      message2 = FactoryGirl.build(:mail, :body => 'http://documentation.mailgun.com/faqs.html#faq')
      message3 = FactoryGirl.build(:mail, :body => 'http://diablocrossfit.com')
      user1 = FactoryGirl.build(:user)
      user1.skip_confirmation!
      user1.save
      user2 = FactoryGirl.build(:user, :email => 'member@member.com')
      user2.skip_confirmation!
      user2.save
      catagory = FactoryGirl.create(:category) 
      user1.bookmarks.create(url: message1.body.to_s, category_id: catagory.id) 
      user1.bookmarks.create(url: message2.body.to_s, category_id: catagory.id) 
      user2.bookmarks.create(url: message3.body.to_s, category_id: catagory.id)
     
    end

    it "should only show the current users book marks" do
      visit user_session_path
     # save_and_open_page
      fill_in 'Email', with: 'admin@example.com'
      fill_in 'Password', with: 'helloworld'     
      click_on('Sign in')
      click_link('My Bookmarks')
      page.should have_content('http://documentation.mailgun.com/faqs.html#faq')
      page.should have_no_content('http://diablocrossfit.com')

    end
  end
  end
end

feature 'User likes a bookmark' do
  describe "liking a bookmark" do
    before (:each) do
     # message1 = FactoryGirl.build(:mail)
     
    #  message2 = FactoryGirl.build(:mail, :body => 'http://documentation.mailgun.com/faqs.html#faq')
      message3 = FactoryGirl.build(:mail, :body => 'http://diablocrossfit.com')
      user1 = FactoryGirl.build(:user)
      user1.skip_confirmation!
      user1.save
      user2 = FactoryGirl.build(:user, :email => 'member@member.com')
      user2.skip_confirmation!
      user2.save
      catagory = FactoryGirl.create(:category) 
      user2.bookmarks.create(url: message3.body.to_s, category_id: catagory.id)
    end
    
    it "should have like link" do
     visit bookmarc_index_path
     click_link('Like')   
    end 

    it "should be linkable to user" do
      visit user_session_path
      fill_in 'Email', with: 'admin@example.com'
      fill_in 'Password', with: 'helloworld'     
      click_on('Sign in')
      click_link('Like')
      click_link('My Bookmarks')
    #  save_and_open_page
      page.should have_content('http://diablocrossfit.com')
    end

    it "should be unlikeable from main page" do
      visit user_session_path
      fill_in 'Email', with: 'admin@example.com'
      fill_in 'Password', with: 'helloworld'  
      click_on('Sign in')
      click_link('Like')
      click_link('BookMarcs')
      save_and_open_page
      click_link('Unlike')
      page.should have_no_content('http://diablocrossfit.com')
    end


    it "should be unlikeable from user personal page" do
      visit user_session_path
      fill_in 'Email', with: 'admin@example.com'
      fill_in 'Password', with: 'helloworld'     
      click_on('Sign in')
      click_link('Like')
     # click_link('BookMarcs')
      click_link('Unlike')
      page.should have_no_content('http://diablocrossfit.com')
    end

  end
end

