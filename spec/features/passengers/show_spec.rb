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

  it 'shows a form to add a flight and is able to add a flight' do
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

    visiit "/passengers/#{kylinna.id}"

    within ".flights" do
      expect(page).to have_link(f1.number)
      expect(page).to have_link(f2.number)
    end

    expect(page).to have_content("Fill in a valid flight number to add a flight:")
    fill_in 'Flight Number', with: f3.number
    clich_button "Add Flight"

    # f3.reload

    expect(current_path).to eq("/passengers/#{kylinna.id}")

    within ".flights" do
      expect(page).to have_link(f1.number)
      expect(page).to have_link(f2.number)
      expect(page).to have_link(f3.number)
    end


  end
  # User Story 3, Assign a Passenger to a Flight
  # ​
  # As a visitor
  # When I visit a passengers show page
  # I see a form to add a flight
  # When I fill in the form with a flight number (assuming these will always be unique)
  # And click submit
  # I'm taken back to the passengers show page
  # And I can see the flight number of the flight I just added
end
