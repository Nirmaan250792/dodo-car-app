class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_car, only: %i[show]
  before_action :set_user, except: %i[index show]

  def new
    @booking = Booking.new(booking_params)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.id = @booking.id
    @booking.start_date = @booking.start_date
    @booking.end_date = @booking.end_date
    if @booking.save
      redirect_to car_path(@car), notice: 'Booking was successfully created.'
    else
      render :new, notice: 'Booking was not created. Please fill fields with valid information.'
    end
  end

  def show
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_user
    @user = current_user
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
