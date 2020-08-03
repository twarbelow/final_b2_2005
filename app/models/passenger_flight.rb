class PassengerFlight < ApplicationRecord
  validates_presence_of :passenger_id,
                        :flight_id

  belongs_to :passenger
  belongs_to :flight
end
