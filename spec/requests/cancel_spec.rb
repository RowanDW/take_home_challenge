require 'rails_helper'

RSpec.describe 'cancel subscription endpoint' do
    before :each do
        @customer = Customer.create!(first_name: "Rowan", last_name: "DeLong", email: "rowan@test.com", address: "123 st")
        @tea = Tea.create!(title: "Oolong", description: "this is a tea", temperature: 200, brew_time: 300)
        @subscription = Subscription.create!(title: "Oolong sub", price: 15.50, status: "Active", tea: @tea, customer: @customer)
    end

    it 'can cancel a subscription ' do
        patch '/subscriptions', params: {id: @subscription.id}
        expect(response).to be_successful

        sub = JSON.parse(response.body, symbolize_names: true)

        expect(sub).to be_a(Hash)
        expect(sub[:data]).to be_a(Hash)
        expect(sub[:data][:id]).to eq(@subscription.id.to_s)
        expect(sub[:data][:type]).to eq("subscription")
        expect(sub[:data][:attributes]).to be_a(Hash)
        expect(sub[:data][:attributes][:title]).to eq("Oolong sub")
        expect(sub[:data][:attributes][:price]).to eq(15.50)
        expect(sub[:data][:attributes][:status]).to eq("Cancelled")
        expect(sub[:data][:attributes][:tea][:id]).to eq(@tea.id)
        expect(sub[:data][:attributes][:customer][:id]).to eq(@customer.id)
    end

    it 'can throw an error given bad inputs' do
        patch '/subscriptions', params: {id: 0}
        expect(response).to_not be_successful

        sub = JSON.parse(response.body, symbolize_names: true)
         expect(sub[:error]).to eq("Couldn't find Subscription with 'id'=0")
    end
end