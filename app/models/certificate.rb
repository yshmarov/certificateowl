class Certificate < ApplicationRecord
  belongs_to :group
  validates :name, presence: true
  validates :email, presence: true
  has_one_attached :qr_code

  extend FriendlyId
  friendly_id :random_hex, use: %i[finders slugged]

  def random_hex
    SecureRandom.hex
  end

  # after_create :generate_qr if group.display_qr?
  # after_create :send_email if group.email?
  after_create :generate_qr
  after_create :send_email

  private

  def generate_qr
    GenerateQrService.new(self).call
  end

  def send_email
    CertificateMailer.with(certificate: self).created
  end
end
