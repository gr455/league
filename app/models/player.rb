class String
	def is_upper?
		return self==self.upcase
	end
end

class Player < ApplicationRecord
	has_one :address
	belongs_to :team
	has_many :appearances
	has_many :games, through: :appearances

	validates :name, :presence => true
	validates :lastname, :presence => true
	validate :name, :first_upper
	validates :team_id, :presence=> true

	def first_upper
		unless name[0].is_upper?
			errors.add(:firstname,"must start with an uppercase letter")
		end
	end
end
