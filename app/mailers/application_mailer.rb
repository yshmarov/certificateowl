class ApplicationMailer < ActionMailer::Base
  default from: "issuer@certificateowl.com"
  layout "mailer"
end
