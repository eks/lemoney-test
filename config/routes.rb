Rails.application.routes.draw do
  root to: 'home#index'
  resources :offers do
    member do
      get :toggle_state
    end
  end
end
