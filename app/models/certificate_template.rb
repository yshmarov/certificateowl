class CertificateTemplate < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
