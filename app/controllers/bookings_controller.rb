class BookingsController < ApplicationController
  before_action :set_booking, only: %I[show edit update]
  def index
    @bookings = Booking.all
    raise
  end

  def show
    authorize @booking
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @animal = Animal.find(params[:animal_id])
    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  def edit
    authorize @booking
  end

  def update
    if params[:booking][:status].present?
      @booking.update(status: params[:booking][:status])
    end

    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:date_in, :date_out, :review_rating, :review_description, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
