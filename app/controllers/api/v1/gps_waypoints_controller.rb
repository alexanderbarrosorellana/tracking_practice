# frozen_string_literal: true

module Api
  module V1
    # Controller to GPS Waypoints
    class GpsWaypointsController < ApplicationController
      def create
        @vehicle = Vehicle.find_or_create_by!(identifier: params[:vehicle_identifier])
        @waypoint = GpsWaypoint.new(gps_waypoint_params.merge(vehicle: @vehicle))
        if @waypoint.save
          render json: { gps_waypoint: @waypoint }, status: :created
        else
          render json: { message: @waypoint.errors }, status: 422
        end
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
