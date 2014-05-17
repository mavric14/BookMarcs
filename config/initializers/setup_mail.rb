if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['SENGRID_USERNAME'],
    password:       ENV['SENGRID_PASSWORD'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end