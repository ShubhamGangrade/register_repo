class College < ApplicationRecord
  belongs_to :lecture
  belongs_to :user

  validates :name, presence: true
end
