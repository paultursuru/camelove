class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # animals = Animal.all
    # ratings = []
    # animals.each do |animal|
    #   animal.bookings.each do |booking|
    #     ratings << booking.review_rating.to_i
    #   end
    #   average = ratings.sub.fdiv(ratings.size).round(2)
    # end
    # @animals = Animal.all.order(average: :desc).first(6)
    @animals = Animal.top_six
  end

  def dashboard
    @animals = current_user.animals # Animal.where(user: current_user)
    # @animal = Animal.new
    @bookings = current_user.bookings
  end
end
