Rails.application.routes.draw do
  resources :stories
  
  root :to => redirect('/stories')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
