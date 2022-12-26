require 'rails_helper'

RSpec.describe User, :type => :model do

  subject {described_class.new(email: "test3@test.com", password: 11223344)}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "is not valid with short password" do
      subject.password = 1
      expect(subject).to_not be_valid
    end
    it "is not valid with incorect email" do
      subject.email = "test"
      expect(subject).to_not be_valid
    end
    it "is not valid if user with email already exist" do
      subject.email = User.last.email
      expect(subject).to_not be_valid
    end
  end
  it { should have_many(:ratings) }
end