class MoviesController < ApplicationController
	before_action :select_movie, only: :show
	before_action :select_movies, only: :index

	def index
		@categories = Movie.select(:category).map(&:category).uniq
	end

	def show; end


	def user_rate
		if Rating.exists?(movie: params[:movie].to_i, user_id: current_user.id)
    	@rate = Rating.where(movie: params[:movie].to_i, user_id: current_user.id).update_all(ratings: params[:ratings].to_f)
			puts "ALREADY EXIST, BUT UPDATED"
		else
    	@rate = Rating.create(rate_params)
  	end
  end

	private
  def rate_params
    {movie_id: params[:movie].to_i, user_id: current_user.id,ratings: params[:ratings].to_f}
  end

	def select_movie
		@movie = Movie.find(params[:id])
	end

	def select_movies
		if params[:category].presence
			@movies = Movie.where(category: params[:category]).page params[:page]
		else
			@movies = Movie.all.page params[:page]
		end
	end
end
