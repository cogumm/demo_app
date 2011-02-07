DemoApp::Application.routes.draw do
  resources :microposts

  #root :to => "user#index"
  
  resources :users
  
end
