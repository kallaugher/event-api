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
      end

      def edit
      end

      def update
      end

      def destroy
      end
    end
  end
end
