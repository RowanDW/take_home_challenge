require 'rails_helper'

RSpec.describe 'get all customer subscriptions endpoint' do
    before :each do
        @customer = Customer.create!(first_name: "Rowan", last_name: "DeLong", email: "rowan@test.com", address: "123 st")
        @tea = Tea.create!(title: "Oolong", description: "this is a tea", temperature: 200, brew_time: 300)
        @subscription = Subscription.create!(title: "Oolong sub", price: 15.50, status: "Active", tea: @tea, customer: @customer)
        @subscription2 = Subscription.create!(title: "Oolong sub 2", price: 15.50, status: "Cancelled", tea: @tea, customer: @customer)

    end

    it 'can get all subscriptions ' do
        get '/subscriptions', params: {id: @customer.id}
        expect(response).to be_successful

        sub = JSON.parse(response.body, symbolize_names: true)

        expect(sub).to be_a(Hash)
        expect(sub[:data]).to be_a(Array)
        expect(sub[:data][0][:id].to_i).to be_an(Integer)
        expect(sub[:data][0][:type]).to eq("subscription")
        expect(sub[:data][0][:attributes]).to be_a(Hash)
        expect(sub[:data][0][:attributes][:title]).to eq("Oolong sub")
        expect(sub[:data][0][:attributes][:price]).to eq(15.5)
        expect(sub[:data][0][:attributes][:status]).to eq("Active")
        expect(sub[:data][0][:attributes][:tea][:id]).to eq(@tea.id)
        expect(sub[:data][0][:attributes][:customer][:id]).to eq(@customer.id)
    end

    it 'can throw an error given bad inputs' do
        get '/subscriptions', params: {id: 0}
        expect(response).to_not be_successful

        sub = JSON.parse(response.body, symbolize_names: true)
         expect(sub[:error]).to eq("Couldn't find Customer with 'id'=0")
    end
end