class Certificate < ApplicationRecord
  belongs_to :group
  validates :name, presence: true
  validates :email, presence: true

  extend FriendlyId
  friendly_id :random_hex, use: %i[finders slugged]

  def random_hex
    SecureRandom.hex
  end
end
