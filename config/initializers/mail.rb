ActionMailer::Base.smtp_settings =  {
  prot:           587,
  addess:         'smtp.mailgun.org',
  user_name:      ENV['MAILGUN_SMTP_LOGIN'],
  password:       ENV['MAILGUN_SMTP_PASSWORD'],
  domain:         'bookmarcs.com',
  authentication:  :plain,
  content_type:   'text/html'
}
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to = 'valente.marc@gmail.com'
    message.cc = nil
    message.bcc = nill
  end
end

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end