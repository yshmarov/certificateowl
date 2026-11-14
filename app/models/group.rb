class Group < ApplicationRecord
  belongs_to :certificate_template
  has_many :certificates
  validates :name, presence: true
end
