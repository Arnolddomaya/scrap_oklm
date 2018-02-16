Rails.application.routes.draw do
  get '/cryptos/index'
  get "crypto/show"


  root "cryptos#index"
  post "/", to: "cryptos#show"
  post "/cryptos/index", to: "cryptos#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
