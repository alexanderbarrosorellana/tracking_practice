require 'rails_helper'
require 'faker'

RSpec.describe 'Vehicles', type: :request do
  describe 'GET /show' do
    context 'when there is locations' do
      before(:each) do
        FactoryBot.create_list(:gps_waypoint, 5).each_with_index do |waypoint, index|
          vehicle_identifier = "#{index}-#{Faker::Vehicle.license_plate}"
          waypoint.vehicle = FactoryBot.create(:vehicle, identifier: vehicle_identifier)
        end
      end

      it 'returns status ok' do
        get '/show'
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when there is no locations' do
      it 'returns status ok' do
        get '/show'
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
