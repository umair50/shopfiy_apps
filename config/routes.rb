Rails.application.routes.draw do
   # root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/app'
  get '/shopify' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#homepage'

  devise_scope :user do
    get "/login" => "devise/sessions#new" # custom path to login/sign_in
  end

  devise_scope :user do
    get "/logout" => "devise/sessions#destroy" # custom path to login/sign_in
  end

  devise_for :users

  resources :equipments do
    collection  do
     get 'index'      
    end
  end
  
  resources :terms

end
