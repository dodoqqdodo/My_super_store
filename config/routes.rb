Rails.application.routes.draw do
  
  #devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  
  root'products#index'
  
  resources :products, only:[:index, :show]
  
  namespace :admin do 
    resources :products
    resources :orders
  end 
  
  resource :cart, only:[:show] do   #單數的resource建立的路徑會比較簡單,沒有id區分,也沒有index, cart單複數沒差
   post 'add', path:'add/:id'
   get 'checkout'
  end
  
  resources :orders, except:[:destroy]
  
end
