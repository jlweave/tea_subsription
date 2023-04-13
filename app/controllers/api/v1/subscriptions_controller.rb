class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(sub_params)
    subscription.status = 'active'
    if subscription.save
      render json: SubscriptionSerializer.new_subscription(subscription), status: 201
    else
      render json: {errors: "Subscription was NOT created!"}, status: 404
    end
  end
  
  def update
    subscription = Subscription.find(params[:id])

    if Subscription.update(sub_params)
      # render json: { 'data': { 'success': "Changes to your subscription have been UPDATED"}}
      render json: SubscriptionSerializer.new_subscription(Subscription.update(params[:id], sub_params))
    else
      render json: {errors: "Subscription was NOT updated!"}, status: 404
    end
  end

  def index
    customer = Customer.find(params[:customer_id])
    subs = customer.subscriptions
    render json: SubscriptionSerializer.all_subscriptions(subs)
  end

  private

  def sub_params
    params.permit(:title, :price, :frequency, :status, :customer_id, :tea_id)
  end
end
