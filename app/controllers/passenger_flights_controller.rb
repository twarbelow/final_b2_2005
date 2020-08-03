class PassengerFlightsController < ApplicationController
  def create
    require 'pry'; binding.pry
    PassengerFlight.create(passenger_id: params[:passenger_id], flight_id: params["Flight Number"])
    redirect_to "/passegners/#{params[:passenger_id]}"
  end
end
