class SubscriptionsController < ApplicationController

    def create
        cust = Customer.find_by(id: params[:customer])
        tea = Tea.find_by(id: params[:tea])
        sub = Subscription.new(title: params[:title], price: params[:price], status: 'Active', customer: cust, tea: tea)
        if sub.save
            render json: SubscriptionSerializer.subscription(sub), status: 200
        else
            render json: { "error": sub.errors.full_messages.join(", ") }, status: 400
        end
    end
end 