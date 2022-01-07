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

  # def create
  #     cust = Customer.find_by(id: params[:customer])
  #     tea = Tea.find_by(id: params[:tea])
  #     sub = Subscription.new(title: params[:title], price: params[:price], status: 'Active', customer: cust, tea: tea)
  #     if sub.save
  #         render json: SubscriptionSerializer.subscription(sub), status: 200
  #     else
  #         render json: { "error": sub.errors.full_messages.to_sentence }, status: 400
  #     end
  # end
end
