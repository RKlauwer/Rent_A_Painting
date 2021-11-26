class BookingsController < ApplicationController
  def index
    @painting = Painting.find(params[:painting_id])
    if @painting.user == current_user
      @bookings = @painting.bookings
    else
      redirect_to "/", notice: "You're not the owner"
    end
  end

  def new
    @painting = Painting.find(params[:painting_id])
    @booking = Booking.new
  end

  def create
    @painting = Painting.find(params[:painting_id])
    @booking = Booking.new(booking_params)
    @booking.painting = @painting
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @painting = @booking.painting
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
