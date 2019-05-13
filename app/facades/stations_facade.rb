class StationsFacade
  def initialize(search)
    @search_term = search["q"]
  end

  def stations
    conn = Faraday.new("https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/?api_key=yxLmV0MF2MDdepeWj58PDNqY9fw47hScScgUTulc&zip=80206&format=json&fuel_type=ELEC&access=public")
    response = conn.get
    results = JSON.parse(response.body)
    binding.pry
  end
end
