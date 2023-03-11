class Group < ApplicationRecord
  belongs_to :certificate_template
  validates :name, presence: true
end
