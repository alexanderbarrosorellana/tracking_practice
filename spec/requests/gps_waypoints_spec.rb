# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GpsWaypoints', type: :request do
  describe 'POST /api/v1/gps' do
    before(:all) do
      @headers = { 'ACCEPT' => 'application/json' }
      @gps_waypoint_params = {
        gps_waypoint: {
          latitude: 20.213,
          longitude: -0.54,
          sent_at: DateTime.now
        }
      }
    end

    context 'when all params are correct' do
      before(:all) do
        @correct_params = @gps_waypoint_params.merge(vehicle_identifier: 'LA-3421')
        post '/api/v1/gps', params: @correct_params, headers: headers
      end

      it 'returns status created' do
        expect(response).to have_http_status(:ok)
      end

      it 'schedules a GPS Waypoint creation' do
        Sidekiq::Testing.fake!
        expect(GpsWaypointJob.jobs.size).to eq(1)
      end
    end

    context 'when vehicle param is missing' do
      before(:all) do
        post '/api/v1/gps', params: @gps_waypoint_params, headers: headers
      end

      it 'returns status 500' do
        expect(response.status).to be(500)
      end
    end
  end
end
