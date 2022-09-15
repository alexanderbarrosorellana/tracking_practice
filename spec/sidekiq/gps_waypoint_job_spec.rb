# frozen_string_literal: true

require 'rails_helper'
RSpec.describe GpsWaypointJob, type: :job do
  describe 'when perform is called' do
    before(:each) do
      vehicle = FactoryBot.create(:vehicle)
      @gps_waypoint = FactoryBot.build(:gps_waypoint, vehicle: vehicle)
    end

    it 'creates a gps waypoint' do
      expect { GpsWaypointJob.new.perform(@gps_waypoint.attributes) }
        .to change { GpsWaypoint.count }.by(1)
    end
  end
end
