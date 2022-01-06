class SubscriptionsController < ApplicationController

    def create
        begin
            cust = Customer.find(params[:customer])
            tea = Tea.find(params[:tea])
            sub = Subscription.create!(title: params[:title], price: params[:price], status: 'Active', customer: cust, tea: tea)
            render json: SubscriptionSerializer.subscription(sub), status: 200
        rescue ActiveRecord::RecordInvalid => error
            render json: { "error": error.message }, status: 400
        rescue ActiveRecord::RecordNotFound => error
            render json: { "error": error.message }, status: 400
        end
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