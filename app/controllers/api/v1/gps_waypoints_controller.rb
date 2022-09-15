# frozen_string_literal: true

module Api
  module V1
    # Controller to GPS Waypoints
    class GpsWaypointsController < ApplicationController
      def create
        @vehicle = Vehicle.find_or_create_by!(identifier: params[:vehicle_identifier])
        @gps_waypoint_attributes = gps_waypoint_params.merge(vehicle_id: @vehicle.id).to_h

        GpsWaypointJob.perform_async(@gps_waypoint_attributes)

        render json: { gps_waypoint: 'GPS Waypoint sent' }, status: :ok
      rescue StandardError => e
        render json: { message: e.message }, status: 500
      end

      private

      def gps_waypoint_params
        params.require(:gps_waypoint).permit(:latitude, :longitude, :sent_at)
      end
    end
  end
end
