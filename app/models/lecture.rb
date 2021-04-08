class Lecture < ApplicationRecord
		include Creatable

	  has_many :colleges
	  has_many :users, through: :colleges
	  has_many :comments, as: :commentable

	  validates :subject, presence: true
	  
end
