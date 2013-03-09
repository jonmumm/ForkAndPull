class DonationsController < ApplicationController

  respond_to :html

  def create
    @donation = Donation.new params[:donation]
    if @donation.save
      flash[:notice] = "Donation received, thank you! Wonderful!"
    else
      flash[:error] = "There was a problem accepting your donation"
    end

    respond_with @donation, :location => root_url
  end

end
