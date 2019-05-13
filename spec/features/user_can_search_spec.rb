require 'rails_helper'
# You will be using this documentation: https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/

feature "user can search for fuel stations" do
scenario "as a visitor with a valid zip code" do
  # As a user
# When I visit "/"
visit '/'
# And I fill in the search form with 80206 (Note: Use the existing search form)
save_and_open_page
fill_in "search", with: "80206"
# And I click "Locate"
click_on "Locate"
expect(current_path).to eq('/stations')
# Then I should see the total results of the stations that match my query, 90.
expect(page).to have_ccontent("90 results")
# Then I should see a list of the 15 closest stations within 5 miles sorted by distance
expect(page).to have_css('.stations', count: 15)
# And the stations should be limited to Electric and Propane
# And the stations should only be public, and not private, planned or temporarily unavailable.
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within(first('.stations')) do
      expect(page).to have_css('.station-name')
      expect(page).to have_css('.station-address')
      expect(page).to have_css('.station-fuel-type')
      expect(page).to have_css('.station-address')
      expect(page).to have_css('.station-distance')
      expect(page).to have_css('.station-access-times')
    end
  end
end
