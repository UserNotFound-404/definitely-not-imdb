class Movie < ApplicationRecord
	has_one_attached :image
	has_many :ratings
	validates :title, :category, :image, :default_rating, presence: true

	def get_average_rating
		all_ratings = ratings.pluck(:ratings)
		sum = all_ratings.sum
		((default_rating + sum)/(all_ratings.count + 1)).round(1)
	end

end
