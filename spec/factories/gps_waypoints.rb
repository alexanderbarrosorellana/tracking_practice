# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :gps_waypoint do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    sent_at { DateTime.now }
    vehicle
  end
end
