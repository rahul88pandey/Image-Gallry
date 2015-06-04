class Album < ActiveRecord::Base
	belongs_to :user
	validates :name ,presence: true,
		length: {minimum: 4}
	has_many :photos , dependent: :destroy
	accepts_nested_attributes_for :photos
end