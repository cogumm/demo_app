DemoApp::Application.routes.draw do
  root :to => "pages#home"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]

  get "users/new"
  get "sessions/new"

  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'

  match '/sign_up',  :to => 'users#new'
  match '/sign_in',  :to => 'sessions#new'
  match '/sign_out', :to => 'sessions#destroy'

end

