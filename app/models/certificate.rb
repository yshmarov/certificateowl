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

  after_create :generate_qr

  private

  def generate_qr
    GenerateQrService.new(self).call
  end
end
