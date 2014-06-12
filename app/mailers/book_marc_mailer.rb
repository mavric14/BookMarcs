class BookMarcMailer < ActionMailer::Base

  def receive(message)
    @message = message
    user = User.find_by_email(message.from)

    name = /#(.*)/.match(message.subject.to_s)
    catagory = Category.find_by(name: name[0])
    if !catagory
      catagory = Category.create(name: name[0])
    end
   user.bookmarks.create(url: message.body.to_s, category_id: catagory.id)   
  end

end