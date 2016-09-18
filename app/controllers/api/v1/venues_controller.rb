module Api
  module V1
  class VenuesController < ApplicationController
      def index
        render json: Venue.all
      end

      def show
        render json: Venue.find(params[:id])
      end

      def new
      end

      def create
        venue = Venue.new(venue_params)
        if venue.save
          render json: venue
        else
          render json: venue.errors, status: 500
        end
      end

      def edit
      end

      def update
      end

      def destroy
      end

      private

      def venue_params
        params.require(:venue).permit(:name, :location, :capacity)
      end

    end
  end
end
