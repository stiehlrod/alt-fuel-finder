require 'rails_helper'
describe FuelStation, type: :model do
  describe 'instance methods' do
    it 'can get station data' do
      attributes = {
       name: "PUBLIC STATIONS",
       address: "123 thatsthe way",
       fuel_type: "bghj",
   }
      station = FuelStation.new(attributes)
      expect(station.name).to eq("PUBLIC STATIONS")
      expect(station.address).to eq("123 thatsthe way")
      expect(station.fuel_type).to eq("bghj")
    end
  end
end
