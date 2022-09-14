# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_many :gps_waypoints
  validates :identifier, uniqueness: true, presence: true
end
