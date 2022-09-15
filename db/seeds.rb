require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

GpsWaypoint.destroy_all
Vehicle.destroy_all

(1..15).each do |number|
  Vehicle.create!(
    identifier: "#{number}-#{Faker::Vehicle.license_plate}"
  )
end

Vehicle.all.each do |vehicle|
  3.times do
    GpsWaypoint.create!(
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      sent_at: Faker::Time.between(from: DateTime.now - 3, to: DateTime.now, format: :default),
      vehicle: vehicle
    )
  end
end
