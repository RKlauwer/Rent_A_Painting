class BookingsController < ApplicationController
  def index
    # @bookings = booking.where(params[:painting_id])
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
      redirect_to painting_booking_path(@painting, @booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
