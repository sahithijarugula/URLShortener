Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "url_shortener#encode"
  get "/url_shortener", to: "url_shortener#encode"
  get "/url_shortener/final1", to: "url_shortener#final_encode"
end
