class SearchSuggestionsController < ApplicationController
	def index
		# puts "SearchSuggestion count : #{SearchSuggestion.count}"
		# render json: %w[foo bar]
		render json: SearchSuggestion.terms_for(params[:term])
	end
end
