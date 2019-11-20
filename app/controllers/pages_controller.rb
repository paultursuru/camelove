class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :get_animals, only: :dashboard
  def home
    @animals = Animal.all.sample(6)
  end

  def dashboard
    @animal = Animal.new
    @bookings = current_user.bookings
  end

  private
  def get_animals
    @animals = Animal.all
  end

  def get_bookings
    @bookings = Booking.all
  end
end
