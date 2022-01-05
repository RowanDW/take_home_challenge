require 'rails_helper'

RSpec.describe 'subscribe customer endpoint' do
    before :each do
        customer = Customer.create!(first_name: "Rowan", last_name: "DeLong", email: "rowan@test.com", address: "123 st")
        tea = Tea.create!(title: "Oolong", description: "this is a tea", temperature: 200, brew_time: )
    end
end