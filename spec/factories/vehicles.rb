# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :vehicle do
    identifier { Faker::Vehicle.license_plate }
  end
end
