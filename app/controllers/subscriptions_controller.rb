class SubscriptionsController < ApplicationController
  def create
    cust = Customer.find(params[:customer])
    tea = Tea.find(params[:tea])
    sub = Subscription.create!(title: params[:title], price: params[:price], status: 'Active', customer: cust,
                               tea: tea)
    render json: SubscriptionSerializer.new(sub).serializable_hash, status: :ok
  rescue ActiveRecord::RecordInvalid => e
    render json: { "error": e.message }, status: :bad_request
  rescue ActiveRecord::RecordNotFound => e
    render json: { "error": e.message }, status: :bad_request
  end

  def cancel
    sub = Subscription.find(params[:id])
    sub.update(status: 'Cancelled')
    render json: SubscriptionSerializer.new(sub).serializable_hash, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { "error": e.message }, status: :bad_request
  end

  def index
    cust = Customer.find(params[:customer])
    render json: SubscriptionSerializer.new(cust.subscriptions).serializable_hash, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { "error": e.message }, status: :bad_request
  end
end
