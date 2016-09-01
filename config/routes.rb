Rails.application.routes.draw do
  
  resources :comments
  resources :subscribers
  devise_for :authors
  resources :authors do
    resources :profiles
  end
  resources :stories
  resources :categories, :only => [:show]
  get "/pages/:page" => "pages#show"
  
  root :to => redirect('/stories')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
