require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do

  describe "GET #index" do
    subject {get :index}
    it "renders home page" do
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("movies/index")
    end
    it "renders the application layout" do
      expect(subject).to render_template("layouts/application")
    end
  end

  describe "GET #show" do
    subject {get "/movies"}
    it "renders movie page" do
      expect(subject).to render_template(:show)
      # expect(subject).to render_template("show")
      #expect(subject).to render_template("movies/show")
    end
  end


end