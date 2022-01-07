rowan = Customer.create!(first_name: "Rowan", last_name: "DeLong", email: "rowan@test.com", address: "123 st")
kovu = Customer.create!(first_name: "Kovu", last_name: "The Cat", email: "kovu@test.com", address: "123 st")

oolong = Tea.create!(title: "Oolong", description: "A type of tea", temperature: 180, brew_time: 150)
jasmine = Tea.create!(title: "Jasmine", description: "A green tea", temperature: 160, brew_time: 150)

Subscription.create!(title: "Rowans oolong subscription", price: 35.99, tea: oolong, customer: rowan)
