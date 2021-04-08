class Profile < ApplicationRecord
	serialize :pet, Array
	
	belongs_to :user
	has_many :educations
  	accepts_nested_attributes_for :educations, allow_destroy: true, reject_if: :all_blank  
end
