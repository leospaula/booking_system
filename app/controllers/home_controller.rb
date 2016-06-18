class HomeController < ApplicationController
  def index
    @hotels = Hotel.includes(:rooms).all
  end
end