require 'rails_helper'

RSpec.describe 'flights show page' do
  it 'shows all flight information for all flights, including airline the flight belongs to, and all passengers on the flight' do
    a1 = Airline.create(name: "Centaur")
    a2 = Airline.create(name: "Avion")

    f1 = Flight.create(number: 123, departure: "SFO", arrival: "SEA", time: "12:30", date: "10/10/20", airline_id: a1.id)
    f2 = Flight.create(number: 234, departure: "JFK", arrival: "LAX", time: "13:30", date: "9/10/20", airline_id: a1.id)
    f3 = Flight.create(number: 345, departure: "FAI", arrival: "ANC", time: "14:30", date: "8/10/20", airline_id: a2.id)

    penny = f1.passengers.create(name: "Penny", age: 2)
    oliver = f1.passengers.create(name: "Oliver", age: 9)
    jordan =f2.passengers.create(name: "Jordan", age: 31)
    taijs = f2.passengers.create(name: "Taija", age: 29)
    milja = f3.passengers.create(name: "Milja", age: 15)
    kylinna = f3.passengers.create(name: "Kylinna", age: 18)

    visit '/flights'

    within ".flight-#{f1.id}" do
      expect(page).to have_content("Flight Number: #{f1.number}")
      expect(page).to have_content("Airline: #{f1.airline}")
      expect(page).to have_content("Departure City: #{f1.departure}")
      expect(page).to have_content("Arrival City: #{f1.arrival}")
      expect(page).to have_content("Departure Time: #{f1.time}")
      expect(page).to have_content("Departure Date: #{f1.date}")
      expect(page).to have_content("Passenger Manifest")
      expect(page).to have_content(penny.name)
      expect(page).to have_content(oliver.name)
    end

    within ".flight-#{f2.id}" do
      expect(page).to have_content("Flight Information")
      expect(page).to have_content("Airline: #{f2.airline}")
      expect(page).to have_content("Flight Number: #{f2.number}")
      expect(page).to have_content("Departure City: #{f2.departure}")
      expect(page).to have_content("Arrival City: #{f2.arrival}")
      expect(page).to have_content("Departure Time: #{f2.time}")
      expect(page).to have_content("Departure Date: #{f2.date}")
      expect(page).to have_content("Passenger Manifest")
      expect(page).to have_content(jordan.name)
      expect(page).to have_content(taija.name)
    end

    within ".flight-#{f3.id}" do
      expect(page).to have_content("Flight Information")
      expect(page).to have_content("Airline: #{f3.airline}")
      expect(page).to have_content("Flight Number: #{f3.number}")
      expect(page).to have_content("Departure City: #{f3.departure}")
      expect(page).to have_content("Arrival City: #{f3.arrival}")
      expect(page).to have_content("Departure Time: #{f3.time}")
      expect(page).to have_content("Departure Date: #{f3.date}")
      expect(page).to have_content("Passenger Manifest")
      expect(page).to have_content(milja.name)
      expect(page).to have_content(kylinna.name)
    end
  end
end



# User Story 1, Flights Show Page
# ​
# As a visitor
# When I visit a flights show page
# I see all of that flights information including:
#   - number
#   - date
#   - time
#   - departure city
#   - arrival city
# And I see the name of the airline this flight belongs
# And I see the names of all of the passengers on this flight
