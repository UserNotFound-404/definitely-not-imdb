require 'rails_helper'

RSpec.describe Rating, :type => :model do

  subject {described_class.new(movie_id: Movie.last.id, user_id: User.last.id, ratings: 9, created_at: DateTime.now, updated_at: DateTime.now)}

  describe "Validations" do
    it "is valid with valid attributes" do #there is a function in controller that check first if rating already exist and if not - creating new object
      expect(subject).to be_valid
    end
    it "is not valid without movie_id" do
      subject.movie_id = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without ratings" do
      subject.ratings = nil
      expect(subject).to_not be_valid
    end
  end
  describe "Update" do
    it "should update rating if already exist" do
      subject.movie_id = Rating.last.movie_id
      subject.user_id = Rating.last.user_id
      if Rating.exists?(movie: subject.movie_id,user_id: subject.user_id)
        Rating.where(movie_id: subject.movie_id, user_id: subject.user_id).update_all(ratings: subject.ratings)
        expect(Rating.exists?(movie: subject.movie_id, user_id: subject.user_id, ratings: subject.ratings)).to eq(true)
      end
    end
  end
  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end

end