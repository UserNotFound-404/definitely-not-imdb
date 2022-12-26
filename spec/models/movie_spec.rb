require 'rails_helper'

RSpec.describe Movie, :type => :model do

  subject {described_class.new(title: "Test_title", body: "Test description",
    category: "test_category", default_rating: 2, created_at: DateTime.now,
    updated_at: DateTime.now, image:Rack::Test::UploadedFile.new("#{Rails.root}/spec/models/test.jpeg"))
}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it "is valid without description" do
    subject.body = nil
    expect(subject).to be_valid
  end
  it "is not valid without a category" do
    subject.category = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an image" do
    subject.image = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without default_rating" do
    subject.default_rating = nil
    expect(subject).to_not be_valid
  end

  it { should have_many(:ratings) }

end