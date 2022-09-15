require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to validate_presence_of :identifier }
  it { is_expected.to validate_uniqueness_of :identifier }

  describe '#most_recent_location' do
    context 'when there is no vehicles' do
      it 'returns an empty array' do
        expect(Vehicle.most_recent_location).to be_empty
      end
    end

    context 'when there is vehicles' do
      before(:each) { @vehicles = FactoryBot.create_list(:vehicle, 5) }

      context 'when there is locations asociated' do
        before(:each) do
          @locations = @vehicles.map do |vehicle|
            FactoryBot.create(:gps_waypoint, vehicle: vehicle)
          end
        end

        it 'returns most recent locations of all vehicles' do
          vehicle_locations = Vehicle.most_recent_location
          expect(vehicle_locations).to eq(@locations)
        end
      end

      context 'when there is no gps waypoints' do
        it 'returns an empty array' do
          locations = Vehicle.most_recent_location
          expect(locations).to be_empty
        end
      end
    end
  end
end
