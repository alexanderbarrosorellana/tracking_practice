# frozen_string_literal: true

# Model representation of Vehicle
class Vehicle < ApplicationRecord
  has_many :gps_waypoints
  validates :identifier, uniqueness: true, presence: true

  class << self
    def most_recent_location
      all.map do |vehicle|
        vehicle.gps_waypoints.order(sent_at: :desc).first
      end.compact
    end
  end
end
