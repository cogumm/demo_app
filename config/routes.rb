DemoApp::Application.routes.draw do
  root :to => "pages#home"

  resources :microposts
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  get "users/new"
  get "sessions/new"

  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

end

