class CertificateTemplate < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :groups
end
