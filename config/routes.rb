DemoApp::Application.routes.draw do
  resources :microposts
  resources :users
  
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"
  
  #root :to => "user#index"
end
