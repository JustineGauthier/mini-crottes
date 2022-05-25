class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @animal = Animal.find(params[:animal_id])
    @booking.user = current_user
    @booking.animal = @animal
    if @booking.save
      redirect_to animal_path(@animal)
    else
      render 'animal'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to animal_path(@booking.animal)
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
