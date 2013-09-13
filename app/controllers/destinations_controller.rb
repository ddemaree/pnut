class DestinationsController < ApplicationController

  def show
    @destination = dest_scope.first!
  end

  def resolve
    @destination = dest_scope.first!
    @destination_url = @destination.url.to_s
    redirect_to @destination_url
  end

  protected

  def dest_scope
    if params[:namespace]
      Destination.where(namespace: params[:namespace], slug: params[:slug])
    elsif params[:slug]
      Destination.where(namespace: "", slug: params[:slug])
    elsif params[:id]
      Destination.with_base36(params[:id])
    else
      Destination.none
    end
  end

end
