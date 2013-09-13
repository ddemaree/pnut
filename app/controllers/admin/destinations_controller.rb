require 'addressable/uri'

class Admin::DestinationsController < ApplicationController
  include AdminController

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find_base36(params[:id])
  end

  def create
    @destination = Destination.with_url(params[:url]).first_or_initialize do |dest|
    end

    if @destination.persisted?
      redirect_to [:admin, @destination]
    else @destination.valid?
      @destination.save
      redirect_to [:admin, @destination]
    end
  end

  def update
    @destination = Destination.find_base36(params[:id])
    destination_params = params.require(:destination).permit(:custom_path, :url, :title)
    @destination.attributes = destination_params

    if @destination.valid?
      @destination.save
      respond_to do |f|
        f.html { redirect_to [:admin, @destination] }
        f.json { render json: {success: true, destination: @destination} }
      end
    else
      render :show
    end
  end

end
