# frozen_string_literal: true

# Class to process jobs for GPS Waypoints
class GpsWaypointJob
  include Sidekiq::Job

  def perform(gps_waypoint = {})
    GpsWaypoint.create(gps_waypoint)
  end
end
