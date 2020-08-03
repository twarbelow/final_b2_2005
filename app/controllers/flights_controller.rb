class FlightsController < ApplicationController
  def index
    @flights = Flights.all
  end
end
