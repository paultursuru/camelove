class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @animals = Animal.all.sample(6)
  end

  def dashboard
    @animals = current_user.animals # Animal.where(user: current_user)
    # @animal = Animal.new
    @bookings = current_user.bookings
  end
end
