# frozen_string_literal: true

# Vehicle Controller
class VehiclesController < ApplicationController
  def show
    @locations = Vehicle.most_recent_location
  end
end
