Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/flights", to: "flights#index"

  get "/passengers/:id", to: "passengers#show"

  post "passenger_flights/create", to: "passenger_flights#create"
end
