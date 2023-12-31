class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(booking_params[:flight_id])
        @num_passengers = booking_params[:num_passengers]
        @num_passengers.to_i.times { @booking.passengers.build }
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            redirect_to @booking
        else
            render :new
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, :num_passengers, passengers_attributes: [:name, :email])
    end
end
