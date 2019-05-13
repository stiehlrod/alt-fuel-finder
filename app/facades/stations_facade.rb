class StationsFacade
  def initialize(search)
    @search_term = search["q"]
  end

  def header
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?api_key=yxLmV0MF2MDdepeWj58PDNqY9fw47hScScgUTulc&location=80206&format=json&fuel_type=ELEC,LPG&access=public&limit=15")
    response = conn.get
    results = JSON.parse(response.body, symbolize_names: true)
    data = results[:total_results]
  end

  def stations
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?api_key=yxLmV0MF2MDdepeWj58PDNqY9fw47hScScgUTulc&location=80206&format=json&fuel_type=ELEC,LPG&access=public&limit=15")
    response = conn.get
    results = JSON.parse(response.body, symbolize_names: true)
    data = results[:fuel_stations]
    data.map do |fuel_station_data|
      FuelStation.new(fuel_station_data)
    end
    # binding.pry
  end
end
