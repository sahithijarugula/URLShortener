Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "url_shortener#index"
  get "/url_shortener", to: "url_shortener#index"
  get "/url_shortener/encode", to: "url_shortener#encode", as: "encode_page"
  get "/url_shortener/decode", to: "url_shortener#decode", as: "decode_page"
end
