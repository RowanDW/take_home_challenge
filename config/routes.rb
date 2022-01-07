Rails.application.routes.draw do
  post '/subscriptions', to: "subscriptions#create"
  patch '/subscriptions', to: "subscriptions#cancel"
  get '/subscriptions', to: "subscriptions#index"
end
