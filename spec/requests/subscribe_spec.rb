require 'rails_helper'

RSpec.describe 'subscribe customer endpoint' do
    before :each do
        @customer = Customer.create!(first_name: "Rowan", last_name: "DeLong", email: "rowan@test.com", address: "123 st")
        @tea = Tea.create!(title: "Oolong", description: "this is a tea", temperature: 200, brew_time: 300)
    end

    it 'can add a subscription ' do
        post '/subscriptions', params: {customer: @customer.id, tea: @tea.id, title: "Sub 1", price: 100}
        expect(response).to be_successful

        sub = JSON.parse(response.body, symbolize_names: true)

        expect(sub).to be_a(Hash)
        expect(sub[:data]).to be_a(Hash)
        expect(sub[:data][:id].to_i).to be_an(Integer)
        expect(sub[:data][:type]).to eq("subscription")
        expect(sub[:data][:attributes]).to be_a(Hash)
        expect(sub[:data][:attributes][:title]).to eq("Sub 1")
        expect(sub[:data][:attributes][:price]).to eq(100)
        expect(sub[:data][:attributes][:status]).to eq("Active")
        expect(sub[:data][:attributes][:tea][:id]).to eq(@tea.id)
        expect(sub[:data][:attributes][:customer][:id]).to eq(@customer.id)
    end

    it 'can throw an error given bad inputs' do
        post '/subscriptions', params: {customer: @customer.id, tea: @tea.id, title: "Sub 1"}
        expect(response).to_not be_successful

        sub = JSON.parse(response.body, symbolize_names: true)
         expect(sub[:error]).to eq("Validation failed: Price can't be blank")

        post '/subscriptions', params: {customer: 1, tea: @tea.id, title: "Sub 1", price: 300}
        expect(response).to_not be_successful

        sub = JSON.parse(response.body, symbolize_names: true)
        expect(sub[:error]).to eq("Couldn't find Customer with 'id'=1")
    end
end