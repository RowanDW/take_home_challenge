Rails.application.routes.draw do
  post '/subscriptions', to: "subscriptions#create"
end
