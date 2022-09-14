require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to validate_presence_of :identifier }
  it { is_expected.to validate_uniqueness_of :identifier }
end
