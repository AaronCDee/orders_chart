Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "charts#orders_by_customer"

  get "/orders/by-month",   to: "charts#orders_by_month"
  get "/orders/by-country", to: "charts#orders_by_country"
end
