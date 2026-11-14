# Preview all emails at http://localhost:3000/rails/mailers/certificate_mailer
class CertificateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/certificate_mailer/created
  def created
    CertificateMailer.with(certificate: Certificate.first).created
  end

end
