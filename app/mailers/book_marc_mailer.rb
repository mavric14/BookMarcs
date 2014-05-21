class BookMarcMailer < ActionMailer::Base

  def receive(message)
    @message = message
    puts message.from
    u = User.first
    print u
    user = User.find_by_email('admin@example.com')
    print user
    user.update(book_mark: message.body)
    
    
  end

end