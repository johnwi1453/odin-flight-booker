class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params)
    @airports = Airport.pluck(:code, :id).sort
    @dates = Flight.get_dates
  end
end