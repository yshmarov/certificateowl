class CertificateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.certificate_mailer.created.subject
  #
  def created
    @certificate = params[:certificate]

    mail to: @certificate.email,
         subject: 'You have been issued a certificate!'
  end
end
