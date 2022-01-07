class SubscriptionsController < ApplicationController
  def create
    sub = Subscription.create!(subscription_params)
    render json: SubscriptionSerializer.new(sub).serializable_hash, status: :ok
  rescue ActiveRecord::RecordInvalid => e
    render json: { "error": e.message }, status: :bad_request
  rescue ActiveRecord::RecordNotFound => e
    render json: { "error": e.message }, status: :bad_request
  end

  def cancel
    sub = Subscription.find(subscription_params[:id])
    sub.update(status: 'Cancelled')
    render json: SubscriptionSerializer.new(sub).serializable_hash, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { "error": e.message }, status: :bad_request
  end

  def index
    cust = Customer.find(subscription_params[:id])
    render json: SubscriptionSerializer.new(cust.subscriptions).serializable_hash, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { "error": e.message }, status: :bad_request
  end
end

private

def subscription_params
  params.permit(:title, :price, :customer_id, :tea_id, :id)
end
