require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path user_id: 1}

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index page' do
      expect(response).to render_template(:index)
    end

    it "should include ''" do
      expect(response.body).to include('Here is a list of posts for a given user')
      puts response.body
    end
  end

  describe 'GET /show' do
    before(:each) { get user_post_path user_id: 1, id: 1 }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index page' do
      expect(response).to render_template(:show)
    end

    it "should include 'Show single post information'" do
      expect(response.body).to include 'Show single post information'
    end
  end
end
