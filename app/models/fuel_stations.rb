class FuelStation
    attr_reader :name,
                      :address,
                      :fuel_type,
                      :distance,
                      :access_times
                      
  def initialize(station_data)
    @name = station_data[:name]
    @address = station_data[:address]
    @fuel_type = station_data[:fuel_type]
    @distance = station_data[:distance]
    @acess_times = station_data[:acess_times]
  end
end
