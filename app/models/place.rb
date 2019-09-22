class Place < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :users

	validates :lat, :lng, presence: true


	attr_accessor :email

end
