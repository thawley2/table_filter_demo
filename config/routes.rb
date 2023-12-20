Rails.application.routes.draw do
  
  root 'players#index'

  resources :players do
    collection do
      get 'list'
    end
  end
end
