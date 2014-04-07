class SubscriptionsController < ApplicationController
  def show
    @subscription = Subscription.find_securely(params[:id])
  end
  
  def new
    @subscription = Subscription.new
  end
  
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      redirect_to @subscription
    else
      render :new
    end
  end
  
private

  def subscription_params
    params.require(:subscription).permit(:term_list, :email)
  end
end