class Rating < ApplicationRecord
	belongs_to :user
	belongs_to :movie
  validates :user_id, :movie_id, :ratings, presence: true
end
