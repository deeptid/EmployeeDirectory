class Employee < ApplicationRecord
	def self.search(search)
      where("first_name LIKE ? OR last_name LIKE ? OR preferred_name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
end
