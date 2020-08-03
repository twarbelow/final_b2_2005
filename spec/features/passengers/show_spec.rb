require 'rails_helper'

RSpec.describe 'passenger show page' do
  it 'shows name of passenger and flight links for the passenger' do
    a1 = Airline.create(name: "Centaur")
    a2 = Airline.create(name: "Avion")

    f1 = Flight.create(number: 123, departure: "SFO", arrival: "SEA", time: "12:30", date: "10/10/20", airline_id: a1.id)
    f2 = Flight.create(number: 234, departure: "JFK", arrival: "LAX", time: "13:30", date: "9/10/20", airline_id: a1.id)
    f3 = Flight.create(number: 345, departure: "FAI", arrival: "ANC", time: "14:30", date: "8/10/20", airline_id: a2.id)

    kylinna = Passenger.create(name: "Kylinna", age: 18)
    f1.passengers << kylinna
    f1.reload
    f2.passengers << kylinna
    f2.reload
    f3.passengers << kylinna
    f3.reload

    visit "/passengers/#{kylinna.id}"

    expect(page).to have_content("Passenger: #{kylinna.name}")
    expect(page).to have_content("Flights for #{kylinna.name}")

    within ".flights" do
      expect(page).to have_link(f1.number)
      expect(page).to have_link(f2.number)
      expect(page).to have_link(f3.number)
    end
  end
end
