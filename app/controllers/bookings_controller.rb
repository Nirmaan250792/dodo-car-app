class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_car, only: [:show, :create]
  before_action :set_user, except: [:index, :show]

  def new
    @booking = Booking.new
  end

  # def create
  #   @booking = Booking.new(booking_params)
  #   if @booking.save
  #     redirect_to car_path(@car), notice: 'Booking was successfully created.'
  #   else
  #     # @bookings = @booking.car
  #     # render "cars/show", notice: 'Booking was not created. Please fill fields with valid information.'
  #     render :new, notice: 'Booking was not created. Please fill fields with valid information.'
  #   end
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to car_path(@car), notice: "Booking was successfully created"
    else
      render 'cars/show', notice: "Booking was not created. Please fill fields with valid information."
    end
  end

  def show
    @bookings = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :is_accepted)
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
