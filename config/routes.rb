Rails.application.routes.draw do
  post '/subscriptions', to: "subscriptions#create"
  patch '/subscriptions', to: "subscriptions#cancel"
end
