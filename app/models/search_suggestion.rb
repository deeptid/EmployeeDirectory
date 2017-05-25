class SearchSuggestion < ApplicationRecord

	def self.terms_for(prefix)
		suggestions = where("term like ?", "#{prefix}_%")
		suggestions.order("popularity desc").limit(5).pluck(:term)
	end

	def self.index_employees
		Employee.find_each do |employee|
			index_term(employee.first_name)
			index_term(employee.last_name)
			employee.first_name.split.each { |t| index_term(t) }
			employee.last_name.split.each { |t| index_term(t) }
	    end
	end

	def self.index_term(term)
	    r = where(term: term.downcase).first_or_initialize do |suggestion|
	      suggestion.increment! :popularity
	    end
	    r.save!

    end
end
