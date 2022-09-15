require 'rails_helper'

RSpec.describe 'Home Controller', type: :request do
  describe 'GET /index' do
    it 'shows status ok and message' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end
end
