Rails.application.routes.draw do

root 'static_pages#index'
resources :users, only:[:new, :create, :show ] 
resources :events, except: [ :edit, :destroy, :update ]
resources :user_events, only: [ :create, :destroy ]

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout',  to: 'sessions#destroy'

end
