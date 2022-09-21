require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:each) { get users_path}
    
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders the index page" do
      expect(response).to render_template(:index)
    end

    it "should include 'Here is a list of users'" do
      expect(response.body).to include("Here is a list of users")
    end
  end

  describe "GET /show" do
    before(:each) { get user_path id: 1}

    it "is a success" do 
      expect(response).to have_http_status(:ok)
    end

    it "renders the index page" do
      expect(response).to render_template(:show)
    end

    it "should include 'Show single user information'" do
      expect(response.body).to include "Show single user information"
    end
  end
end

