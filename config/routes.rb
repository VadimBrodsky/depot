Rails.application.routes.draw do
  get 'admin/index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts

  get 'store/index'

  resources :products do
    get :who_bought, on: :member
  end

  root 'store#index', as: 'store'
end
