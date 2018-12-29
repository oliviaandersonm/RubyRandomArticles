Rails.application.routes.draw do
  resources :articles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'articles#index'
  
  get 'articles' => 'articles#index'
  
  get 'articles/new' => 'articles#new'
  post 'articles' => 'articles#create'
  
  
end
