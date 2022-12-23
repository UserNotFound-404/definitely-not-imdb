class MoviesController < ApplicationController
	before_action :select_movie, only: :show
	before_action :select_movies, only: :index

	def index
		@categories = Movie.select(:category).map(&:category).uniq
	end

	def show; end

	def get_rating
		"2"
	end

	private 

	def select_movie
		@movie = Movie.find(params[:id])
	end

	def select_movies
		#binding.pry
		if params[:category]
			@movies = Movie.where(category: params[:category]).page params[:page]
		else
			@movies = Movie.all.page params[:page]
		end
	end
end
