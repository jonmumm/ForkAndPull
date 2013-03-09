class SubscribersController < ApplicationController

  respond_to :html

  def create
    @subscriber = Subscriber.new params[:subscriber]
    if @subscriber.save
      flash[:notice] = "You've been added to our mailing list. Thanks for the support!"
    else
      flash[:error] = "There was a problem adding you to the list"
    end

    respond_with @subscriber, :location => root_url
  end

end
