class BookingsController < ApplicationController
  before_action :set_booking, only: %I[show edit update]
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @animal = Animal.find(params[:animal_id])
    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save
      redirect_to animal_bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to animal_bookings_path(@booking.animal)
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: "Your booking was successfully updated."
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_in, :date_out, :review_rating, :review_description, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
