class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  validates_presence_of :number,
                        :departure,
                        :arrival,
                        :time,
                        :date
end
