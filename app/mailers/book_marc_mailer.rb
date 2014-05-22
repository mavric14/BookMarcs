class BookMarcMailer < ActionMailer::Base

  def receive(message)
    @message = message
    user = User.find_by_email('admin@example.com')
    print user
    user.update(book_mark: message.body.to_s)
    
    
  end

end